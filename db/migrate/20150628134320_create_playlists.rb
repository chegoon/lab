class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :pl_id
      t.string :title
      t.text :description
      t.string :thumbnail_url
      t.datetime :published_at
      t.string :tag
      t.references :channel, index: true

      t.timestamps
    end
  end
end
