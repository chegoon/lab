class Playlist < ActiveRecord::Base
  belongs_to :channel
  has_many :playlist_items, dependent: :destroy
end
