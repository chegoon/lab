class AddColumnsToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :view_count, :integer
    add_column :channels, :video_count, :integer
    add_column :channels, :dislike_count, :integer
    add_column :channels, :subscriber_count, :integer
    add_column :channels, :comment_count, :integer
  end
end
