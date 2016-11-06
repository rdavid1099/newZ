class Pitch < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates :headline , presence: true
  validates :story_url, presence: true
  validates :abstract, presence: true
end
