defmodule Tube2cast do
  def run! do
    playlist_id = "PLX4wzH6YPQH3x25S7U6zp56wTopd1YYEN"
    items = Playlist.fetch(playlist_id)

    feed_items = Stream.with_index(items)
                 |> Enum.map(fn ({item, index}) -> Templates.feed_item(item, index) end)
                 |> Enum.join

    Templates.feed(feed_items)
  end
end