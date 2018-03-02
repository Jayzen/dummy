class Like < ApplicationRecord
  belongs_to :article, counter_cache: true
  belongs_to :user
end
