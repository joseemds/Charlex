defmodule Charlex.Command.Dnd do
  use Charlex.Command
  alias Nostrum.Api
  alias Charlex.Api.DndClient
  require Logger

  import Nostrum.Struct.Embed

  def run(context, [category]) do
    options =
      DndClient.fetch_info(category)
      |> Enum.map(fn x -> Map.get(x, "name") end)
      |> Enum.join("\n")

    IO.inspect(options)

    Api.create_message(context.message.channel_id,
      embed:
        %Nostrum.Struct.Embed{}
        |> put_title("Available #{category}")
        |> put_description(options)
    )
  end

  def run(context, [field, index]) do
    with {:ok, %{body: body}} <- DndClient.get("/#{field}/#{index}") do
      Api.create_message(context.message.channel_id,
        embed:
          %Nostrum.Struct.Embed{}
          |> put_title(body["index"])
          |> put_color(431_948)
          |> put_field("name", body["name"], true)
          |> put_field("index", body["index"])
      )
    end
  end
end
