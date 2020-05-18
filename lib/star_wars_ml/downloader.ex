defmodule Downloader do
  def download(read_path, write_path) do
    {:ok, file_content} = read_file(read_path)

    image_urls = file_content
      |> String.split("\n")
      |> Enum.filter(& !is_nil(&1))

    IO.puts "Downloading from #{read_path} and saving results to #{write_path}"

    image_urls
      |> Enum.with_index
      |> Enum.each(fn({image_url, i}) ->
        clean_url = image_url
          |> String.trim_leading("\"")
          |> String.trim_trailing("\"")

        valid_url = String.length(clean_url) > 0

        if valid_url do
          try do
            data = Fetcher.fetch(clean_url)
            if data, do: Saver.save("image-#{i}.jpg", write_path, data)
          rescue
            Protocol.UndefinedError ->
              IO.puts "Error fetching: #{clean_url}"
          catch
            value -> IO.puts "Error fetching: #{clean_url} with error: #{IO.inspect(value)}"
          end
        end
      end)

    true
  end

  defp read_file(filename) do
    File.read(filename)
  end
end
