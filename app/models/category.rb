# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string
#  ancestry           :integer
#  weight             :integer          default(0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  subordinates_count :integer          default(0)
#
# Indexes
#
#  index_categories_on_ancestry  (ancestry)
#  index_categories_on_name      (name)
#

class Category < ApplicationRecord
  has_ancestry orphan_strategy: :destroy
  before_validation :correct_ancestry
  
  validates :name, presence: { message: "标签名称不能为空" }
  validates :name, uniqueness: { message: "标签名称需唯一" }

  has_many :articles, dependent: :destroy
  has_many :subordinates, class_name: "Category", foreign_key: "ancestry"

  def self.grouped_data
    self.roots.order("weight desc").inject([]) do |result, parent|
      row = []
      row << parent
      row << parent.children.order("weight desc")
      result << row
    end
  end
 
  private
    def correct_ancestry
      self.ancestry = nil if self.ancestry.blank?
    end
end
