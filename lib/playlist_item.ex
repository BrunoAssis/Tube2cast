defmodule PlaylistItem do
  def extract_item(item) do
    snippet = item["snippet"]
    video_id = snippet["resourceId"]["videoId"]
    
    %{
      title: snippet["title"],
      description: snippet["description"],
      video_id: video_id,
      thumbnail: snippet["thumbnails"]["high"]["url"],
      published_at: snippet["publishedAt"],
      video_url: video_url(video_id)
    }
  end

  defp video_url(video_id) do
    {output, 0} = System.cmd("youtube-dl", ["-g", video_id, "-f", choose_format(video_id)])
    
    output
    |> String.strip
    |> HtmlEntities.encode
  end

  defp choose_format(video_id) do
    {output, 0} = System.cmd("youtube-dl", ["-F", video_id])

    output
    |> String.split("\n")
    |> Enum.find(&best_line?/1)
    |> extract_format
    |> List.first
  end

  defp best_line?(line) do
    String.match?(line, ~r/\(best\)/)
  end

  defp extract_format(line) do
    Regex.run(~r/^\d+/, line)
  end
end