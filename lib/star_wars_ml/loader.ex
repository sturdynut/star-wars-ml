defmodule Loader do
  def load(path_to_json_file, path_to_save_images) do
    {:ok, json} = get_json(path_to_json_file)

    image_urls = json["images"]

    image_urls
      |> Enum.with_index
      |> Enum.each(fn({image_url, i}) ->
        data = Fetcher.fetch(image_url)
        if data, do: Saver.save("image-#{i}.jpg", path_to_save_images, data)

        # Why won't this work?
        # image_url
        #   |> Fetcher.fetch
        #   |> Saver.save("image-#{i}.jpg", path)
      end)

    image_urls
  end

  defp get_json(filename) do
    with {:ok, file_content} <- File.read(filename) do
      Poison.decode(file_content)
    end
  end
end
