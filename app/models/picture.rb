# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  attach     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Picture < ApplicationRecord
  mount_uploader :attach, AttachmentUploader
end
