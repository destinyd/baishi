class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :user_id
      t.datetime :over_at
      t.integer :body_id
      t.integer :state
      t.timestamps
    end
    add_index :projects, :user_id
    add_index :projects, :body_id
    add_index :projects, :state
  end

  def self.down
    drop_table :projects
  end
end
