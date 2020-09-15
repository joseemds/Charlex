defmodule Charlex.Command.Help do
  use Charlex.Command

  alias Nostrum.Api
  import Nostrum.Struct.Embed

  @embed_color 0xEB1313

  @impl true
  def run(context, args) do
    case args do
      [command_name] ->
        Api.create_message(context.message.channel_id,
          embed:
            %Nostrum.Struct.Embed{}
            |> put_title("Help for #{command_name}")
            |> put_color(@embed_color)
            |> put_description(get_command_description(command_name))
            |> put_field("Usage", get_command_usage(command_name))
        )

      _ ->
        Api.create_message(context.message.channel_id,
          embed:
            %Nostrum.Struct.Embed{}
            |> put_title("List of commands")
            |> put_color(@embed_color)
            |> put_description(format_command_list(Charlex.get_commands()))
        )
    end
  end

  def format_command_list(command_list) do
    """
    List of commands
    #{Map.keys(command_list) |> Enum.join("\n")}
    """
  end

  defp get_command_usage(command_name) do
    commands = Charlex.get_commands()

    commands[command_name] |> apply(:usage, [])
  end

  defp get_command_description(command_name) do
    commands = Charlex.get_commands()

    commands[command_name] |> apply(:description, [])
  end
end
