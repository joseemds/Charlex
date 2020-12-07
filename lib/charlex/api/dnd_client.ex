defmodule Charlex.Api.DndClient do
  use HTTPoison.Base

  alias __MODULE__

  @base_url "https://www.dnd5eapi.co/api"

  def process_request_url(url) do
    @base_url <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
  end

  # classes = DndClient.get("/classes")
  # races = DndClient.get("/races")
  # spells = DndClient.get("/spells")
  # equipments = DndClient.get("/equipment")
  # monsters = DndClient.get("/monsters")

  def get_equipments_list() do
    {:ok, equipments} = DndClient.get("/equipment")

    equipments
    |> Map.get(:body)
    |> Map.get("results")
  end

  def get_races_list() do
    {:ok, races} = DndClient.get("/races")

    races
    |> Map.get(:body)
    |> Map.get("results")
  end

  def get_spells_list() do
    {:ok, spells} = DndClient.get("/spells")

    spells
    |> Map.get(:body)
    |> Map.get("results")
  end

  def get_classes_list() do
    {:ok, classes} = DndClient.get("/classes")

    classes
    |> Map.get(:body)
    |> Map.get("results")
  end

  def get_monster_list() do
    {:ok, monsters} = DndClient.get("/monsters")

    monsters
    |> Map.get(:body)
    |> Map.get("results")
  end
end
