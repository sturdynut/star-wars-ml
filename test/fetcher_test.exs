defmodule FetcherTest do
  use ExUnit.Case
  doctest Fetcher

  test "can fetch images" do
    url = "https://static1.srcdn.com/wordpress/wp-content/uploads/2019/12/More-Baby-Yoda-Merch-Has-Finally-Been-Revealed.jpg"
    image = Fetcher.fetch(url)

    assert image != nil
  end
end
