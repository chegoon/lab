class Team < ActiveRecord::Base
	has_many :joins
	has_many :channels, through: :joins
	has_many :team_statistics, dependent: :destroy
end
