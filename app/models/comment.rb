class Comment < ApplicationRecord
  belongs_to :user

  validates :body, presence: true

  def ups
    likes_dislikes.where('ups = ?', true).count
  end

  def downs
    likes_dislikes.where('downs = ?', true).count
  end

  def post_reply(params)
    reply = Comment.create(params)
    return false if reply.id.nil?
    CommentReply.create(parent_id: id,
                        child_id: reply.id)
    reply
  end

  def replies
    comment_replies.pluck('child_id').map do |child_id|
      Comment.find(child_id)
    end
  end

  def parent
    Comment.find(comment_parent.parent_id)
  end

  def likes_dislikes
    LikesDislike.where('comment_id = ?', id)
  end

  private
    def comment_replies
      CommentReply.where('parent_id = ?', id)
    end

    def comment_parent
      CommentReply.where('child_id = ?', id).first
    end
end
