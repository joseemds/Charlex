defmodule Charlex.Api.DndClient do
  use HTTPoison.Base

  @base_url "https://www.dnd5eapi.co/api"
  @useful_fields ~w"name index age alignment size"

  def process_request_url(url) do
    @base_url <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
    |> Map.take(@useful_fields)
  end
end
