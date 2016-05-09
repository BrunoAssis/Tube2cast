defmodule Playlist do
  @api_key "AIzaSyC7HMqZfMnmMMYFNugV8iPnxaKAhSQqr9M"

  def fetch(playlist_id) do
    url = "/playlistItems?part=snippet&maxResults=50&key=#{@api_key}&playlistId=#{playlist_id}"
    YouTube.start
    YouTube.get!(url)
    |> Map.get(:body)
    |> extract_items
  end

  defp extract_items(playlist) do
    Enum.map(playlist["items"], &PlaylistItem.extract_item/1)
  end
end
