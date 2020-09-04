defmodule Charlex do
  alias Charlex.Server

  def get_state do
    GenServer.call(Server, :get_state)
  end

  def get_owner() do
    GenServer.call(Server, :get_owner)
  end

  def fetch_owner() do
    GenServer.cast(Server, :fetch_owner)
  end

  def put_commands(commands) do
    GenServer.call(Server, {:put_commands, commands})
  end
end
