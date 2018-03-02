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
