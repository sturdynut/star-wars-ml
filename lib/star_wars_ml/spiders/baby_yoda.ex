defmodule BabyYodaSpider do
  use Crawly.Spider

  @impl Crawly.Spider
  def base_url(), do: "https://www.ecosia.org"

  @impl Crawly.Spider
  def init() do
    IO.puts "Baby yoda spider init"

    [
      start_urls: [
        "https://www.ecosia.org/images?q=baby+yoda"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)

    pagination_urls = [
      "/images?q=baby+yoda&p=1",
      "/images?q=baby+yoda&p=2",
      "/images?q=baby+yoda&p=3",
      "/images?q=baby+yoda&p=4",
    ]

    requests =
      pagination_urls
      |> Enum.map(&build_absolute_url/1)
      |> Enum.map(&Crawly.Utils.request_from_url/1)

    images =
      document
      |> Floki.find(".js-image-result")
      |> Floki.attribute("href")
      |> Enum.map(&build_image_url/1)

    %Crawly.ParsedItem{
      :requests => requests,
      :items => images
    }
  end

  defp build_absolute_url(url), do: URI.merge(base_url(), url) |> to_string()

  defp build_image_url(url) do
    URI.merge("https://hniesfp.imgix.net", url) |> to_string()
  end
end
