defmodule CharlexTest do
  use ExUnit.Case
  doctest Charlex

  test "greets the world" do
    assert Charlex.hello() == :world
  end
end
