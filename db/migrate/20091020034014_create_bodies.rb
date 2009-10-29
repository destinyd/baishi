class CreateBodies < ActiveRecord::Migration
  def self.up
    create_table :bodies do |t|
      t.text :body
    end
  end

  def self.down
    drop_table :bodies
  end
end
