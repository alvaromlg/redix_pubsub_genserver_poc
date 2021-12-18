defmodule PubSub.Server do
  use GenServer

  alias PubSub.Message
  alias PubSub.Redis

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end

  @impl true
  def init(stack) do

    Redis.configure

    {:ok, stack}
  end

  @impl true
  def handle_info(message, state) do
    Message.handle_message(message)
    {:noreply, state}
  end

end
