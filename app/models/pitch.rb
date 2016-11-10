class Pitch < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates :headline , presence: true
  validates :story_url, presence: true
  validates :abstract, presence: true

  def ups
    likes_dislikes.where('ups = ?', true).count
  end

  def downs
    likes_dislikes.where('downs = ?', true).count
  end

  def comments
    Comment.where('pitch_id = ?', id)
  end

  def likes_dislikes
    LikesDislike.where('pitch_id = ?', id)
  end
end
