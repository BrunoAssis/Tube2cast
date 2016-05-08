defmodule PlaylistItem do
  def convert_item(item) do
    snippet = item["snippet"]
    %{
      title: snippet["title"],
      description: snippet["description"],
      video_id: snippet["resourceId"]["videoId"],
      thumbnail: snippet["thumbnails"]["high"]["url"],
      published_at: snippet["publishedAt"]
    }
  end
end