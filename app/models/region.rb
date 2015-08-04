class Region < ActiveRecord::Base
	has_many :popularities
	has_many :channels, through: :popularities
end
