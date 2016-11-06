class Pitch < ApplicationRecord
  belongs_to :user
  belongs_to :story
  has_many :comments

  validates :headline , presence: true
  validates :story_url, presence: true
  validates :abstract, presence: true
end
