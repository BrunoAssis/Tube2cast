defmodule Templates do
  require EEx

  @base_path "lib/templates/"

  EEx.function_from_file :def, :feed, @base_path <> "feed.eex", [:feed_items]
  EEx.function_from_file :def, :feed_item, @base_path <> "feed_item.eex", [:item, :index]
end