defmodule DownloaderTest do
  use ExUnit.Case
  doctest Downloader

  test "can fetch images" do
    read_path = "./training_data/test.txt"
    write_path = "./tmp"
    done = Downloader.download(read_path, write_path)

    assert done == true
  end
end
