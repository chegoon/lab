class Team < ActiveRecord::Base
	has_many :joins
	has_many :channels, through: :joins
end
