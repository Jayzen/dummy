# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  actor_id           :integer
#  notify_type        :string           not null
#  target_type        :string
#  target_id          :integer
#  second_target_type :string
#  second_target_id   :integer
#  third_target_type  :string
#  third_target_id    :integer
#  read_at            :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_notifications_on_user_id                  (user_id)
#  index_notifications_on_user_id_and_notify_type  (user_id,notify_type)
#

# Auto generate with notifications gem.
class Notification < ActiveRecord::Base
  include Notifications::Model

  # Write your custom methods...
end
