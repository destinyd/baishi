class CreateCategorys < ActiveRecord::Migration
  def self.up
    create_table :categorys do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
    add_index(:categorys, :parent_id)
  end

  def self.down
    drop_table :categorys
  end
end
