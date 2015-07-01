class PlaylistItem < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :video
  #belongs_to :channel
end
