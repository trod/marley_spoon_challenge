defmodule MarleySpoon.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      MarleySpoon.Storage.Chefs,
      MarleySpoon.Storage.Recipes,
      MarleySpoon.Worker,
      MarleySpoonWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: MarleySpoon.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    MarleySpoonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
