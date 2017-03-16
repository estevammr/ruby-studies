class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :subject
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
