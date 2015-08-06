class Region < ActiveRecord::Base
	has_many :popularities
	has_many :channels, through: :popularities
	has_many :region_statistics, dependent: :destroy
end
