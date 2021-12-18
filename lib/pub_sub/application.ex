defmodule PubSub.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [strategy: :one_for_one]
    |> PubSub.Supervisor.start_link
  end

end
