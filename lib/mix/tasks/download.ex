defmodule Mix.Tasks.Download do
  use Mix.Task

  @shortdoc "Loads up the images in the training_data folder."
  def run(_) do
    Mix.Task.run "app.start"

    training_data_json = Path.join(File.cwd!, "training_data/BabyYodaSpider.json")
    path_to_save_images = Path.join(File.cwd!, "training_data/images")

    Loader.load(training_data_json, path_to_save_images)
  end
end
