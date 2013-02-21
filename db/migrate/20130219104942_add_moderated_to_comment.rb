class AddModeratedToComment < ActiveRecord::Migration
  def change
    add_column :comments, :moderated, :boolean, :default => false
  end
end
