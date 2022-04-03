class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.text :notes
      t.boolean :completed?
      
      t.integer :goal_id

      t.timestamps
    end
  end
end
