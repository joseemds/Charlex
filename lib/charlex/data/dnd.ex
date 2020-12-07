defmodule Charlex.Data.Dnd do
  @moduledoc false
  alias Charlex.Api.DndClient

  use GenServer


  def start_link(_opts) do
    classes = DndClient.get("/classes")
    races = DndClient.get("/races")
    spells = DndClient.get("/spells")
    equipments = DndClient.get("/equipment")
    monsters = DndClient.get("/monsters")
    
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end
end
