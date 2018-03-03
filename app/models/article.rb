# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  title          :string
#  content        :text
#  user_id        :integer
#  slug           :string
#  category_id    :integer
#  view_count     :integer          default(0)
#  comments_count :integer          default(0)
#  status         :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  likes_count    :integer          default(0)
#  set_comments   :boolean          default(TRUE)
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_slug         (slug) UNIQUE
#  index_articles_on_user_id      (user_id)
#

class Article < ApplicationRecord
  searchkick
  belongs_to :user, counter_cache: true
  belongs_to :category
  has_many :comments, dependent: :destroy

  has_many :likes
  has_many :users, through: :likes
  has_many :follows
  has_many :users, through: :follows
  has_many :keeps
  has_many :users, through: :keeps

  validates :title, presence: true
  validates :content, presence: true

  module Status
    On = true
    Off = false
  end

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  def should_generate_new_friendly_id?
    title_changed?
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
end
