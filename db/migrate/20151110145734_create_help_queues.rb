class CreateHelpQueues < ActiveRecord::Migration
  def change
    create_table :help_queues do |t|
      t.references :student_id, index: true, foreign_key: true
      t.references :teacher_id, index: true, foreign_key: true
      t.string :status
      t.timestamps null: false
    end
  end
end
