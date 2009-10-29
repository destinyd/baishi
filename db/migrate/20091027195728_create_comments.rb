class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :parent, :polymorphic => true
      t.integer :body_id
      t.integer :user_id
      t.timestamps
    end
    add_index :comments,  :parent_id
    add_index :comments,  :parent_type
    add_index :comments,  :user_id
  end

  def self.down
    drop_table :comments
  end
end
