class AddUserEmail < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :email
    end
    User.update_all [ "email = ?", "nobody@nowhere.com" ]
  end

  def down
    remove_column :users, :email
  end
end
