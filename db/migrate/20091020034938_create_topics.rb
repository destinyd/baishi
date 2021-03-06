class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.integer :user_id
      t.integer :body_id
      t.integer :category_id
      t.integer :shared_type

      t.timestamps
    end
    add_index(:topics, :user_id)
    add_index(:topics, :body_id)
    add_index(:topics, :category_id)
  end

  def self.down
    drop_table :topics
  end
end
