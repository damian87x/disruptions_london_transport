class CreateDisruptions < ActiveRecord::Migration
  def change
    create_table :disruptions do |t|
      t.integer :uniq_id

      t.timestamps
    end
  end
end
