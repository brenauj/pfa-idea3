class AddCommentableTypeToComment < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.string :commentable_type
    end
  end
end
