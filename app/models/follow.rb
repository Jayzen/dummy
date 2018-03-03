# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_follows_on_article_id  (article_id)
#  index_follows_on_user_id     (user_id)
#

class Follow < ApplicationRecord
  belongs_to :article
  belongs_to :user
end
