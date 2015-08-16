# encoding: utf-8
class TeamsWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(team_id = 0)
		puts "team worker is performing"
		
		team = Team.find(team_id) if team_id != 0
		# if parameter channel is username
		if (team_id != 0) && team
			
			update_team(team)
		else
			teams = Team.all
			teams.each do |t|
        		update_team(t)
			end
		end
	end

	private
	def update_team(t)
		puts "update_team is called #{t.id}"

		team = Team.find(t.id)
		channels = team.channels
		
		team.update(channel_count: channels.count, video_count: channels.pluck(:video_count).reduce(:+), view_count: channels.pluck(:view_count).reduce(:+), subscriber_count: channels.pluck(:subscriber_count).reduce(:+), comment_count: channels.pluck(:comment_count).reduce(:+))

		stat = team.team_statistics.create
		stat.update(channel_count: channels.count, video_count: channels.pluck(:video_count).reduce(:+), view_count: channels.pluck(:view_count).reduce(:+), comment_count: channels.pluck(:comment_count).reduce(:+), subscriber_count: channels.pluck(:subscriber_count).reduce(:+))
		
	end
end