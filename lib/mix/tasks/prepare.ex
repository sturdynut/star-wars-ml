defmodule Mix.Tasks.Prepare do
  use Mix.Task

  @shortdoc "Prepares images for training the model"
  def run(_) do
    Mix.Task.run "app.start"

    image_paths = Path.join(File.cwd!, "training_data/images/baby_yoda/*.jpg")
      |> Path.wildcard

    Enum.each(image_paths, &Resizer.resize(&1))

    IO.puts "Done preparing files"
  end
end
