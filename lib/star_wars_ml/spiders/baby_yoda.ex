defmodule BabyYodaSpider do
  use Crawly.Spider

  @impl Crawly.Spider
  def base_url(), do: "https://www.ecosia.org"

  @impl Crawly.Spider
  def init() do
    [
      start_urls: [
        "https://www.ecosia.org/images?q=baby+yoda"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)

    pagination_urls = document |> Floki.find("ol.pager li a") |> Floki.attribute("href")

    images =
      document
      |> Floki.find(".js-image-result")
      |> Floki.attribute("href")
      |> Enum.map(&build_image_url/1)

    %{
      :requests => [],
      :items => [
        %{
          images: images
        }
      ]
    }
  end

  defp build_image_url(url) do
    URI.merge("https://hniesfp.imgix.net", url) |> to_string()
  end
end
