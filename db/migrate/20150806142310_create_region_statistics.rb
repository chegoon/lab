class CreateRegionStatistics < ActiveRecord::Migration
  def change
    create_table :region_statistics do |t|
      t.references :region
      t.integer :channel_count
      t.integer :view_count
      t.integer :video_count
      t.integer :subscriber_count
      t.integer :comment_count

      t.timestamps
    end
  end
end
