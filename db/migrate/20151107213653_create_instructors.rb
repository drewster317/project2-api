class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :given_name
      t.string :surname

      t.timestamps null: false
    end
  end
end
