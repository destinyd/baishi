class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.integer :user_id
      t.datetime :over_at
      t.integer :body_id
      t.integer :rank
      t.integer :state

      t.timestamps
    end
    add_index :tasks, :project_id
    add_index :tasks,:user_id
    add_index :tasks,:body_id
    add_index :tasks,:state
  end

  def self.down
    drop_table :tasks
  end
end
