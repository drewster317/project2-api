class AddInstructorRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instructor_role, :boolean, :default => false
  end
end
