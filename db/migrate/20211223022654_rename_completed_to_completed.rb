class RenameCompletedToCompleted < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :completed?, :completed
  end
end
