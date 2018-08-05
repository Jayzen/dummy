# == Schema Information
#
# Table name: keeps
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_keeps_on_article_id  (article_id)
#  index_keeps_on_user_id     (user_id)
#

class Keep < ApplicationRecord
  belongs_to :article
  belongs_to :user
end
