class AddUsernameToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :username, :string
  end
end
