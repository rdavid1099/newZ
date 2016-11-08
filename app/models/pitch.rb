class Pitch < ApplicationRecord
  belongs_to :user
  belongs_to :story
  has_many :comments
  has_many :likes_dislikes

  validates :headline , presence: true
  validates :story_url, presence: true
  validates :abstract, presence: true

  def ups
    likes_dislikes.where('ups = ?', true).count
  end

  def downs
    likes_dislikes.where('downs = ?', true).count
  end
end
