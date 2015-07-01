class RenameColumnToVideoStatistics < ActiveRecord::Migration
  def change
  	rename_column :video_statistics, :favoirte_count, :favorite_count
  end
end
