defmodule PubSub.Message do

  @moduledoc """
    Message handlers
  """

  def handle_message({:redix_pubsub, _pid, _ref, :subscribed, %{channel: channel}}) do
    IO.puts "Subscribed to #{channel}"
  end

  def handle_message({:redix_pubsub, _pid, _ref, :message, %{channel: channel, payload: message}}) do
    IO.puts "Received message #{message} from #{channel}"
  end

  def handle_message(message), do: message

end
