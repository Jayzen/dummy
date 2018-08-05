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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
