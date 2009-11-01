class CreateUserTasks < ActiveRecord::Migration
  def self.up
    create_table :user_tasks do |t|
      t.integer :task_id
      t.integer :user_id
      t.timestamps
    end
    add_index :user_tasks, :task_id
    add_index :user_tasks, :user_id
  end

  def self.down
    drop_table :user_tasks
  end
end
