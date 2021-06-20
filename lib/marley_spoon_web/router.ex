defmodule MarleySpoonWeb.Router do
  use MarleySpoonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api
  end

  scope "/api" do
    forward "/graph", Absinthe.Plug, schema: MarleySpoonWeb.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MarleySpoonWeb.Schema
  end
end
