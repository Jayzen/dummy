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
