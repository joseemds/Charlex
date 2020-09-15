defmodule Charlex.Api.DndClient do
  use HTTPoison.Base

  @base_url "https://www.dnd5eapi.co/api"

  def process_request_url(url) do
    @base_url <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
  end
end
