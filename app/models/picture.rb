class Picture < ApplicationRecord
  mount_uploader :attach, AttachmentUploader
end
