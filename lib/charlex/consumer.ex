defmodule Charlex.Consumer do
  use Nostrum.Consumer
  require Logger
  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
  end

  def handle_event({:READY, _msg, _ws_state}) do
    alias Charlex.Command

    %{}
    |> Charlex.put_commands()

    Charlex.fetch_owner()
  end

  def handle_event(_), do: :noop
end
