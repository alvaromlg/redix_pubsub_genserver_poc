defmodule PubSub.Message do

  alias PubSub.Converter

  @moduledoc """
    Message handlers
  """

  def handle_message({:redix_pubsub, _pid, _ref, :subscribed, %{channel: channel}}) do
    IO.puts "Subscribed to #{channel}"
  end

  def handle_message({:redix_pubsub, _pid, _ref, :message, %{channel: channel, payload: message}}) do
     case Path.extname(message) do
       "" ->  IO.puts "Received message #{message} from #{channel}"
       ".jpg" -> Converter.convert_to_pdf(message)
     end
  end

  def handle_message(message), do: message

end
