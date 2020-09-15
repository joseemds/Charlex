defmodule Charlex.Handler do
  require Logger

  def handle_message(message) do
    context = %{message: message}

    with {:ok, content, _prefix} <- extract_content(message) do
      commands = Charlex.get_commands()

      command =
        content
        |> String.split()
        |> List.first()
        |> String.downcase()

      cond do
        Map.has_key?(commands, command) == true ->
          module = Map.get(commands, command)

          run_command(module, [context, parse_command_args(module, content)])

        true ->
          Nostrum.Api.create_message(
            context.message.channel_id,
            "Ehhh i dont know what that means"
          )
      end
    end
  end

  defp parse_command_args(command_module, command) do
    apply(command_module, :parse_args, [command])
  end

  defp run_command(command_module, args) do
    apply(command_module, :run, args)
  end

  @spec extract_content(Map.t()) :: {:ok, String.t(), String.t()} | nil
  defp extract_content(message) do
    state = Charlex.get_state()
    prefix = state.prefixes[message.guild_id] || state.prefixes[:global]

    cond do
      String.starts_with?(message.content, prefix) ->
        content =
          message.content
          |> String.slice(String.length(prefix)..-1)
          |> String.trim()

        {:ok, content, prefix}

      true ->
        nil
    end
  end
end
