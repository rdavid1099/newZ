class Comment < ApplicationRecord
  belongs_to :pitch
  belongs_to :user
  has_many :likes_dislikes

  validates :body, presence: true

  def ups
    likes_dislikes.where('ups = ?', true).count
  end

  def downs
    likes_dislikes.where('downs = ?', true).count
  end
end
