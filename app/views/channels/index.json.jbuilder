json.array!(@channels) do |channel|
  json.extract! channel, :id, :ch_id, :title, :description, :published_at, :thumbnail_url
  json.url channel_url(channel, format: :json)
end
