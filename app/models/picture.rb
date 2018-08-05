# == Schema Information
#
# Table name: pictures
#
#  id         :bigint(8)        not null, primary key
#  attach     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Picture < ApplicationRecord
  mount_uploader :attach, AttachmentUploader
end
