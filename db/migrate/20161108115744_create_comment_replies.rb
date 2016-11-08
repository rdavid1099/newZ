class CreateCommentReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_replies do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end
end
