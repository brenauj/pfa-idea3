class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user
      t.references :commentable

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :commentable_id
  end
end
