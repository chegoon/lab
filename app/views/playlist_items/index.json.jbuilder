json.array!(@playlist_items) do |playlist_item|
  json.extract! playlist_item, :id, :playlist_id, :video_id, :it_id, :title, :description, :published_at, :thumbnail_url, :position
  json.url playlist_item_url(playlist_item, format: :json)
end
