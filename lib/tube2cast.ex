defmodule Tube2cast do
  def run! do
    IO.puts "Starting process."
    xml_feed = Playlist.fetch("PLX4wzH6YPQH3x25S7U6zp56wTopd1YYEN")
               |> to_feed
    IO.puts "Writing file."
    File.open!("feed.xml", [:write])
    |> IO.binwrite(xml_feed)
    |> File.close
    IO.puts "Ending process."
  end

  defp to_feed(items) do
    items
    |> generate_feed_items_xml
    |> Templates.feed
  end

  defp generate_feed_items_xml(items) do
    Stream.with_index(items)
    |> Enum.map(&generate_feed_item_xml/1)
    |> Enum.join
  end

  defp generate_feed_item_xml({item, index}) do
    Templates.feed_item(item, index)
  end
end
