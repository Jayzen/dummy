# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  content    :text(65535)
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
  
  validates :content, presence: true

  after_commit :create_notifications, on: :create

  private
    def create_notifications
      Notification.create(
        notify_type: 'comment',
        actor: self.user,
        user: self.article.user,
        target: self,
        second_target: self.article
      )
    end
end
