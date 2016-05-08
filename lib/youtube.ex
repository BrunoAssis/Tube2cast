defmodule YouTube do
  use HTTPoison.Base

  @base_url "https://www.googleapis.com/youtube/v3"

  def process_url(url) do
    @base_url <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end
end