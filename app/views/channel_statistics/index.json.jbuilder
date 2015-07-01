json.array!(@channel_statistics) do |channel_statistic|
  json.extract! channel_statistic, :id, :channel_id, :video_count, :view_count, :comment_count, :subscriber_count
  json.url channel_statistic_url(channel_statistic, format: :json)
end
