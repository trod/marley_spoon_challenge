defmodule MarleySpoonWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use MarleySpoonWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import MarleySpoonWeb.ConnCase

      alias MarleySpoonWeb.Router.Helpers, as: Routes
      alias MarleySpoonWeb.GraphqlHelper

      # The default endpoint for testing
      @endpoint MarleySpoonWeb.Endpoint

      # warning: dirty hack below, close your eyes and ignore. :see_no_evil
      def cleanup_ets() do
        :ets.delete(:chefs, "1Z8SwWMmS8E84Iogk4E6ik")
        :ets.delete(:chefs, "11khwUJbtwiiI0k84cQgSK")
        :ets.delete(:chefs, "NysGB8obcaQWmq0aQ6qkC")
        :ets.delete(:chefs, "1")
        :ets.delete(:chefs, "2")
        :ets.delete(:chefs, "3")

        :ets.delete(:recipes, "1")
        :ets.delete(:recipes, "2")
        :ets.delete(:recipes, "3")
        :ets.delete(:recipes, "4dT8tcb6ukGSIg2YyuGEOm")
        :ets.delete(:recipes, "5jy9hcMeEgQ4maKGqIOYW6")
        :ets.delete(:recipes, "2E8bc3VcJmA8OgmQsageas")
        :ets.delete(:recipes, "437eO3ORCME46i02SeCW46")
      end

      def graphql_query(conn, options) do
        conn
        |> post(
          "/api/graph",
          GraphqlHelper.build_query(options[:query], options[:variables])
        )
        |> json_response(200)
      end
    end
  end

  setup _tags do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
