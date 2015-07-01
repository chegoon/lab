class CreateVideoStatistics < ActiveRecord::Migration
  def change
    create_table :video_statistics do |t|
      t.references :video, index: true
      t.integer :view_count
      t.integer :like_count
      t.integer :dislike_count
      t.integer :favoirte_count
      t.integer :comment_count

      t.timestamps
    end
  end
end
