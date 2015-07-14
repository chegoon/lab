class AddColumnToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :view_count, :integer
    add_column :videos, :like_count, :integer
    add_column :videos, :dislike_count, :integer
    add_column :videos, :favorite_count, :integer
    add_column :videos, :comment_count, :integer
  end
end
