defmodule Mix.Tasks.Download do
  use Mix.Task

  @shortdoc "Loads up the images in the training_data folder."
  def run(_) do
    Mix.Task.run "app.start"

    read_path = Path.join(File.cwd!, "training_data/BabyYodaSpider.txt")
    write_path = Path.join(File.cwd!, "training_data/images")

    Downloader.download(read_path, write_path)
  end
end
