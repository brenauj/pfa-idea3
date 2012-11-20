class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.belongs_to :box
      t.belongs_to :user

      t.timestamps
    end
    add_index :ideas, :box_id
    add_index :ideas, :user_id
  end
end
