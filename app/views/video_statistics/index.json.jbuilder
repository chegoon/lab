json.array!(@video_statistics) do |video_statistic|
  json.extract! video_statistic, :id, :video_id, :view_count, :like_count, :dislike_count, :favoirte_count, :comment_count
  json.url video_statistic_url(video_statistic, format: :json)
end
