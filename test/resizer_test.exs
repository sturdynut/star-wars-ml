defmodule ResizerTest do
  use ExUnit.Case
  doctest Resizer

  test "can resize a file" do
    read_path = "./training_data/test.txt"
    write_path = "./tmp"
    Downloader.download(read_path, write_path)

    path = Path.join(File.cwd!, "tmp/image-0.jpg")

    result = Resizer.resize(path)

    assert result != nil
  end
end
