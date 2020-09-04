defmodule Charlex.Server do
  use GenServer

  defstruct(owner: "", commands: %{}, prefix: Application.get_env(:charlex, :prefix) || ":")

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %__MODULE__{}, name: __MODULE__)
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:get_owner, _from, state) do
    {:reply, state.owner, state}
  end

  def handle_call({:put_commands, commands}, _from, state) do
    {:reply, :ok, %{state | commands: commands}}
  end

  @impl true
  def handle_cast(:fetch_owner, state) do
    {:ok, %{owner: %{id: string_id}}} = Nostrum.Api.get_application_information()
    {:noreply, %{state | owner: String.to_integer(string_id)}}
  end
end
