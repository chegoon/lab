class Popularity < ActiveRecord::Base
	belongs_to :channel
	belongs_to :region
end
