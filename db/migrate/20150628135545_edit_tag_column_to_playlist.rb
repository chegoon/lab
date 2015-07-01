class EditTagColumnToPlaylist < ActiveRecord::Migration
  def change
  	change_column :playlists, :tag, :text
  	rename_column :playlists, :tag, :tags
  end
end
