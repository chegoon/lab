class AddColumnsToRegions < ActiveRecord::Migration
  def change
  	add_column :regions, :channel_count, :integer
    add_column :regions, :view_count, :integer
    add_column :regions, :video_count, :integer
    add_column :regions, :subsicriber_count, :integer
    add_column :regions, :comment_integer, :integer
  end
end
