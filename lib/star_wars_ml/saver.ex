defmodule Saver do
  def save(file_name, path, data) do
    File.write!("#{path}/#{file_name}", data)
  end
end
