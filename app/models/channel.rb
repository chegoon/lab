class Channel < ActiveRecord::Base
	has_many :channel_statistics, dependent: :destroy
	has_many :playlists, dependent: :destroy
	has_many :videos, dependent: :destroy
	has_many :popularities
	has_many :regions, through: :popularities
	has_many :joins
	has_many :teams, through: :joins
	#has_many :playlist_items, dependent: :destroy

	self.per_page = 20
end
