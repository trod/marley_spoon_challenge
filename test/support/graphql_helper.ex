defmodule MarleySpoonWeb.GraphqlHelper do
  @moduledoc """
  Test helpers for graphql API
  """

  def build_query(query, variables) do
    %{
      "query" => query,
      "variables" => variables
    }
  end
end
