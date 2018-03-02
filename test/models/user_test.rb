# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string
#  password_digest     :string
#  name                :string
#  admin               :boolean          default(FALSE)
#  superadmin          :boolean          default(FALSE)
#  forbidden           :boolean          default(FALSE)
#  remember_digest     :string
#  avatar              :string
#  activation_digest   :string
#  activated           :boolean          default(FALSE)
#  gender              :string
#  activated_at        :datetime
#  reset_digest        :string
#  reset_sent_at       :datetime
#  slug                :string
#  notifications_count :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  comments_count      :integer          default(0)
#  articles_count      :integer          default(0)
#  description         :text
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
