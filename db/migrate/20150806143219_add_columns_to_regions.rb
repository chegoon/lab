class AddColumnsToRegions < ActiveRecord::Migration
  def change
  	add_column :regions, :channel_count, :integer
    add_column :regions, :view_count, :integer
    add_column :regions, :video_count, :integer
    add_column :regions, :subscriber_count, :integer
    add_column :regions, :comment_count, :integer
  end
end
