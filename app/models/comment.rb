# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#

class Comment < ApplicationRecord
  belongs_to :article, counter_cache: true
  belongs_to :user, counter_cache: true
  has_many :notifications, as: :notifiable
  
  validates :content, presence: true
  after_create :create_notifications

  private
    def create_notifications
      @recipient = self.article.user
      Notification.create(recipient: @recipient, actor: self.user, action: 'posted', notifiable: self)
    end
end
