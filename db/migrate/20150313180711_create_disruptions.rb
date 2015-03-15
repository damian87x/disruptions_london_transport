class CreateDisruptions < ActiveRecord::Migration
  def change
    create_table :disruptions do |t|
      t.integer :uniq_id   , limit: 7
      t.string :status
      t.string :severity
      t.string :levelOfInterest
      t.string :category
      t.string :subCategory
      t.datetime :startTime
      t.datetime :endTime
      t.datetime :remarkTime
      t.datetime :lastModTime
      t.string :location
      t.string :corridor
      t.text :comments
      t.text :currentUpdate
      t.text :CauseArea, :limit => 4294967295
      t.timestamps
    end
  end
end
