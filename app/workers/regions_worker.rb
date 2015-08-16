# encoding: utf-8
class RegionsWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(region_id = 0)
		puts "region worker is performing"
		
		region = Region.find(region_id) if region_id != 0
		# if parameter channel is username
		if (region_id != 0) && region
			
			update_region(region)
		else
			regions = Region.all
			regions.each do |r|
        		update_region(r)
			end
		end
	end

	private
	def update_region(r)
		puts "update_region is called #{r.id}"

		region = Region.find(r.id)
		channels = region.channels
		
		region.update(channel_count: channels.count, video_count: channels.pluck(:video_count).reduce(:+), view_count: channels.pluck(:view_count).reduce(:+), subscriber_count: channels.pluck(:subscriber_count).reduce(:+), comment_count: channels.pluck(:comment_count).reduce(:+))

		stat = region.region_statistics.create
		stat.update(channel_count: channels.count, video_count: channels.pluck(:video_count).reduce(:+), view_count: channels.pluck(:view_count).reduce(:+), comment_count: channels.pluck(:comment_count).reduce(:+), subscriber_count: channels.pluck(:subscriber_count).reduce(:+))
		
	end
end