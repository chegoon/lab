class CreatePlaylistItems < ActiveRecord::Migration
  def change
    create_table :playlist_items do |t|
      t.references :playlist, index: true
      t.references :video, index: true
      t.string :it_id
      t.string :title
      t.text :description
      t.datetime :published_at
      t.string :thumbnail_url
      t.integer :position

      t.timestamps
    end
  end
end
