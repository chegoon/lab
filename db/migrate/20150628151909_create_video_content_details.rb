class CreateVideoContentDetails < ActiveRecord::Migration
  def change
    create_table :video_content_details do |t|
      t.references :video, index: true
      t.integer :duration
      t.boolean :stereoscopic
      t.boolean :hd
      t.boolean :captioned
      t.boolean :licensed
      t.boolean :age_restricted

      t.timestamps
    end
  end
end
