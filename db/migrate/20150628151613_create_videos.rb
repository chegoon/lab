class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :v_id
      t.string :title
      t.text :description
      t.datetime :published_at
      t.string :thumbnail_url
      t.references :channel, index: true

      t.timestamps
    end
  end
end
