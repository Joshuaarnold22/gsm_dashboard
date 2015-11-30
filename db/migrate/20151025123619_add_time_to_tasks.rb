class AddTimeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :days_to_complete, :integer, default: 1
  end
end
