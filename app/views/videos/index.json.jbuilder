json.array!(@videos) do |video|
  json.extract! video, :id, :v_id, :title, :description, :published_at, :thumbnail_url, :channel_id
  json.url video_url(video, format: :json)
end
