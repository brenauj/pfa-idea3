class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :name
      t.text :description
      t.belongs_to :user

      t.timestamps
    end
    add_index :boxes, :user_id
  end
end
