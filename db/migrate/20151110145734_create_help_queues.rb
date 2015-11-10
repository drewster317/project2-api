class CreateHelpQueues < ActiveRecord::Migration
  def change
    create_table :help_queues do |t|

      t.string :student_id
      t.string :instructor_id
      t.timestamps null: false

    end
  end
end
