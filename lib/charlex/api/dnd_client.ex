defmodule Charlex.Api.DndClient do
  use HTTPoison.Base

  @base_url "https://www.dnd5eapi.co/"

  def process_request_url(url) do
    @base_url <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
  end

  def fetch_info(category) do
    {:ok, info} =
      case category do
        "race" -> get("api/races")
        "spell" -> get("api/spells")
        "equipment" -> get("api/equipment")
        "class" -> get("api/classes")
        "monster" -> get("api/monsters")
      end

    info
    |> Map.get(:body)
    |> Map.get("results")
  end

  # def get_equipments_info(), do: get_info("equipment")
  # def get_races_info(), do: get_info("race")
  # def get_spells_info(), do: get_info("spell")
  # def get_classes_info(), do: get_info("class")
  # def get_monsters_info(), do: get_info("monster")
end
