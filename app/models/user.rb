# == Schema Information
#
# Table name: users
#
#  id                  :bigint(8)        not null, primary key
#  email               :string(255)
#  password_digest     :string(255)
#  name                :string(255)
#  admin               :boolean          default(FALSE)
#  superadmin          :boolean          default(FALSE)
#  forbidden           :boolean          default(FALSE)
#  remember_digest     :string(255)
#  avatar              :string(255)
#  activation_digest   :string(255)
#  activated           :boolean          default(FALSE)
#  gender              :string(255)
#  activated_at        :datetime
#  reset_digest        :string(255)
#  reset_sent_at       :datetime
#  slug                :string(255)
#  notifications_count :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  comments_count      :integer          default(0)
#  articles_count      :integer          default(0)
#  description         :text(65535)
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_slug   (slug) UNIQUE
#

class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token, :old_password, 
                :crop_x, :crop_y, :crop_w, :crop_h

  mount_uploader :avatar, AvatarUploader
  after_update :crop_avatar

  before_save { self.email = email.downcase }
  before_create :create_activation_digest

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255}, uniqueness: { case_sensitive: false }
  validates :email, format: { with: VALID_EMAIL_REGEX }, unless: proc{ |user| user.email.blank? }
  validates :password, length: { minimum: 6 }, allow_nil: true
    
  has_secure_password

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id
  
  has_many :likes, dependent: :destroy
  has_many :like_topics, through: :likes, source: :article
  has_many :follows, dependent: :destroy
  has_many :follow_topics, through: :follows, source: :article
  has_many :keeps, dependent: :destroy
  has_many :keep_topics, through: :keeps, source: :article

  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower 
  
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_later
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    name_changed?
  end
  
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end
