class CreateDisruptions < ActiveRecord::Migration
  def change
    create_table :disruptions do |t|
      t.integer :uniq_id   , limit: 7
      t.string :status
      t.string :severity
      t.string :level_of_interest
      t.string :category
      t.string :subCategory
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :remark_time
      t.datetime :last_mod_time
      t.string :location
      t.string :corridor
      t.text :comments
      t.text :current_update
      t.text :cause_area
      t.timestamps
    end
  end
end
