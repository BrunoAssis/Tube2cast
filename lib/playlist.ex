require IEx

defmodule Playlist do
  @api_key "AIzaSyC7HMqZfMnmMMYFNugV8iPnxaKAhSQqr9M"

  def fetch do
    fetch("PLX4wzH6YPQH3x25S7U6zp56wTopd1YYEN")
  end

  def fetch(playlist_id) do
    url = "/playlistItems?part=snippet&maxResults=50&key=#{@api_key}&playlistId=#{playlist_id}"
    YouTube.start
    YouTube.get!(url)
    |> Map.get(:body)
    |> convert_items
  end

  defp convert_items(playlist) do
    %{"items" => items} = playlist
    Enum.map(items, &PlaylistItem.convert_item/1)
    |> IO.inspect
  end
end