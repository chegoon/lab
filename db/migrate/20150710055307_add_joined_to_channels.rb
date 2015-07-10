class AddJoinedToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :joined, :boolean
  end
end
