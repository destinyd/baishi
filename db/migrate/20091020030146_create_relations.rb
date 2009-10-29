class CreateRelations < ActiveRecord::Migration
  def self.up
    create_table :relations do |t|
      t.integer :user_id
      t.integer :to_id
      t.integer :rtype

      t.timestamps
    end
    add_index(:relations, :user_id)
    add_index(:relations, :to_id)
  end

  def self.down
    drop_table :relations
  end
end
