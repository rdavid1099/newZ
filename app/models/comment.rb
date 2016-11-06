class Comment < ApplicationRecord
  belongs_to :pitch
  belongs_to :user

  validates :body, presence: true
end
