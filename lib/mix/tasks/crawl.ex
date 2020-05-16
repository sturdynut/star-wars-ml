defmodule Mix.Tasks.Crawl do
  use Mix.Task

  @shortdoc "Crawls for images and stores in trainind data json file."
  def run(_) do
    Mix.Task.run "app.start"

    Crawly.Engine.start_spider(BabyYodaSpider)
  end
end
