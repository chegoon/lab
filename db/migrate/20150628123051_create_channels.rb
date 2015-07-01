class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :ch_id
      t.string :title
      t.text :description
      t.datetime :published_at
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
