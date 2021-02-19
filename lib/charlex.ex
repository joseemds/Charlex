defmodule Charlex do
  alias Charlex.Server

  def get_commands do
    %{commands: commands} = get_state()
    commands 
  end

  def alo(som) do 
    som
    |> Enum.map(fn x -> x end)
         |> Enum.filter(fn x -> x == 2 end)
  end


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
