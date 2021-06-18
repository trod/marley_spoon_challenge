defmodule MarleySpoon.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      MarleySpoon.Storage.Chefs,
      MarleySpoon.Storage.Recipes
    ]

    opts = [strategy: :one_for_one, name: MarleySpoon.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
