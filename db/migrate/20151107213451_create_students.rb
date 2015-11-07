class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :given_name
      t.string :surname

      t.timestamps null: false
    end
  end
end
