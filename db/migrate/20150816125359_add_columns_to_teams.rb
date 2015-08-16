class AddColumnsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :channel_count, :integer
    add_column :teams, :view_count, :integer
    add_column :teams, :video_count, :integer
    add_column :teams, :subscriber_count, :integer
    add_column :teams, :comment_count, :integer
  end
end
