class LikesDislike < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :pitch
end
