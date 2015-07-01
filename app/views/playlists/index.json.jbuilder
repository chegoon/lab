json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :pl_id, :title, :description, :thumbnail_url, :published_at, :tag, :channel_id
  json.url playlist_url(playlist, format: :json)
end
