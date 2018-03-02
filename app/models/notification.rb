class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User', counter_cache: true
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
end
