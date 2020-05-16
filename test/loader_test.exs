defmodule LoaderTest do
  use ExUnit.Case
  doctest Loader

  test "can fetch images" do
    path = "./training_data/test.json"
    path_to_save_images = "./training_data/images"
    images = Loader.load(path, path_to_save_images)

    assert images != nil
  end
end
