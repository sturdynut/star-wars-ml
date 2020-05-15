defmodule StarWarsMlTest do
  use ExUnit.Case
  doctest StarWarsMl

  test "greets the world" do
    assert StarWarsMl.hello() == :world
  end
end
