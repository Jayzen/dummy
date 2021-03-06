# == Schema Information
#
# Table name: articles
#
#  id             :bigint(8)        not null, primary key
#  title          :string(255)
#  content        :text(65535)
#  user_id        :integer
#  slug           :string(255)
#  category_id    :integer
#  view_count     :integer          default(0)
#  comments_count :integer          default(0)
#  status         :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  likes_count    :integer          default(0)
#  set_comments   :boolean          default(TRUE)
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_slug         (slug) UNIQUE
#  index_articles_on_user_id      (user_id)
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
