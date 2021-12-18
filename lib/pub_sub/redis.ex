defmodule PubSub.Redis do

  @moduledoc """
    Redis setup
  """

  def configure do
      :pubsub
      |> Application.get_env(:redis_host)
      |> Redix.PubSub.start_link(name: :redix)
      |> subscribe(Application.get_env(:pubsub, :channel))
  end

  def subscribe({:ok, pubsub}, channel) do
    Redix.PubSub.subscribe(pubsub, channel, self())
  end
end
