class AddFinishedAtToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :finished_at, :datetime
    add_index :tasks, :finished_at
  end
end
