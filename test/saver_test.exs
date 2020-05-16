defmodule SaverTest do
  use ExUnit.Case
  doctest Saver

  test "can save a file" do
    file_name = "test.jpg"
    path = "./tmp"

    url = "https://static1.srcdn.com/wordpress/wp-content/uploads/2019/12/More-Baby-Yoda-Merch-Has-Finally-Been-Revealed.jpg"
    data = Fetcher.fetch(url)

    result = Saver.save(file_name, path, data)

    assert result != nil
  end
end
