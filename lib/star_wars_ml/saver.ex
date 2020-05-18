defmodule Saver do
  def save(file_name, path, data) do
    IO.puts "Saving...#{path}/#{file_name}"
    File.write!("#{path}/#{file_name}", data)
  end
end
