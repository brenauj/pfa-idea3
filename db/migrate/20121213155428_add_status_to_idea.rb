class AddStatusToIdea < ActiveRecord::Migration
  def change
    change_table :ideas do |t|
      t.integer :status
    end
  end
end
