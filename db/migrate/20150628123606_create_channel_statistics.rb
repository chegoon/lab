class CreateChannelStatistics < ActiveRecord::Migration
  def change
    create_table :channel_statistics do |t|
      t.references :channel, index: true
      t.integer :video_count
      t.integer :view_count
      t.integer :comment_count
      t.integer :subscriber_count

      t.timestamps
    end
  end
end
