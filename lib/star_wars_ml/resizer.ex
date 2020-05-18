import Mogrify

defmodule Resizer do
  def resize(path) do
    IO.puts "Resizing...#{path}"
    open(path)
      |> resize_to_fill("224x224")
      |> gravity("Center")
      |> save(in_place: true)
  end
end
