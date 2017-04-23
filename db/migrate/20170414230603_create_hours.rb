class CreateHours < ActiveRecord::Migration[5.0]
  def change
    create_table :hours do |t|
      t.float :quantity
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
