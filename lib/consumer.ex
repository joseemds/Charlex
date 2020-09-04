defmodule Charlex.Consumer do
  use Nostrum.Consumer
  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    case msg.content do
      "!derrubar servidores" ->
        Api.create_message(
          msg.channel_id,
          "Iniciando operação black scree, derrubando servidores"
        )

        :timer.sleep(500)
        Api.create_message(msg.channel_id, "10%")
        :timer.sleep(500)
        Api.create_message(msg.channel_id, "20%")
        :timer.sleep(1000)
        Api.create_message(msg.channel_id, "30%")
        :timer.sleep(1000)
        Api.create_message(msg.channel_id, "40%")
        :timer.sleep(1000)
        Api.create_message(msg.channel_id, "50%")
        :timer.sleep(1000)
        Api.create_message(msg.channel_id, "60%")
        :timer.sleep(500)
        Api.create_message(msg.channel_id, "70%")
        :timer.sleep(500)
        Api.create_message(msg.channel_id, "80%")
        :timer.sleep(500)
        Api.create_message(msg.channel_id, "90%")
        :timer.sleep(2000)
        Api.create_message(msg.channel_id, "100%, servidores derrubados, sem aula pessoal")

      _ ->
        :noop
    end
  end

  def handle_event(_), do: :noop
end
