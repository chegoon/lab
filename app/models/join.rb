class Join < ActiveRecord::Base
	belongs_to :team
	belongs_to :channel
end
