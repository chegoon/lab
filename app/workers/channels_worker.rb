# encoding: utf-8
class ChannelsWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(channel_id = 0)
		#puts "chan worker is performing"
		channel = Channel.find(channel_id) if channel_id != 0
		if (channel_id != 0) && channel
			yt_ch = Yt::Channel.new id: channel.ch_id
			update_channel(channel, yt_ch)
		else
			channels = Channel.all
			channels.each do |ch|
        		yt_ch = Yt::Channel.new id: ch.ch_id
        		update_channel(ch, yt_ch)
			end
		end
	end

	private
	def update_channel(ch, yt_ch)

        ch.update(title: yt_ch.title, description: yt_ch.description, published_at: yt_ch.published_at, thumbnail_url: yt_ch.thumbnail_url, video_count: yt_ch.video_count, view_count: yt_ch.view_count, comment_count: yt_ch.comment_count, subscriber_count: yt_ch.subscriber_count)
        ch.channel_statistics.create(video_count: yt_ch.video_count, view_count: yt_ch.view_count, comment_count: yt_ch.comment_count, subscriber_count: yt_ch.subscriber_count)

        yt_pls = yt_ch.playlists
        if yt_pls
			yt_pls.each do |yt_pl|					
				pl = ch.playlists.find_or_create_by(pl_id: yt_pl.id)
				pl.update(title: yt_pl.title, description: yt_pl.description, thumbnail_url: yt_pl.thumbnail_url, tags: yt_pl.tags, published_at: yt_pl.published_at)
				yt_pl.playlist_items.each do |yt_it|
					it = pl.playlist_items.find_or_create_by(it_id: yt_it.id)
					it.update(title: yt_it.title, description: yt_it.description, published_at: yt_it.published_at, thumbnail_url: yt_it.thumbnail_url, video_id: yt_it.video_id)
				end
			end
        end

        yt_videos = yt_ch.videos
        if yt_videos
			yt_videos.each do |yt_v|
				video = ch.videos.find_or_create_by(v_id: yt_v.id)	            
				if video.update(title: yt_v.title, description: yt_v.description, published_at: yt_v.published_at, thumbnail_url: yt_v.thumbnail_url)
					v_content = VideoContentDetail.find_or_create_by(video_id: video.id)
					v_content.update(duration: yt_v.duration, stereoscopic: yt_v.stereoscopic?, hd: yt_v.hd?, captioned: yt_v.captioned?, licensed: yt_v.licensed?, age_restricted: yt_v.age_restricted?)
					video.video_statistics.create(view_count: yt_v.view_count, like_count: yt_v.like_count, dislike_count: yt_v.dislike_count, favorite_count: yt_v.favorite_count, comment_count: yt_v.comment_count)
				end
			end
        end		        
   
	end
end