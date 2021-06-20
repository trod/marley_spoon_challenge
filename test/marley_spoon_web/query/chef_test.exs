defmodule MarleySpoonWeb.Query.ChefTest do
  @moduledoc false
  use MarleySpoonWeb.ConnCase
  alias MarleySpoon.Storage.Chefs
  alias MarleySpoon.Model.Chef, as: ChefModel

  setup do
    cleanup_ets()

    :ok
  end

  test "query chef by id", %{conn: conn} do
    id = "3"
    name = "new_name"

    Chefs.put(id, %ChefModel{id: id, name: name})

    %{"data" => %{"chef" => %{"id" => chef_id, "name" => chef_name}}} =
      conn
      |> graphql_query(
        query: """
        {
           chef(id: "3") {
            id
            name
          }
        }
        """
      )

    assert id == chef_id
    assert name == chef_name
  end

  test "query all chefs", %{conn: conn} do
    Chefs.put("1", %ChefModel{id: "1", name: "chef_1"})
    Chefs.put("2", %ChefModel{id: "2", name: "chef_2"})

    %{
      "data" => %{
        "chefs" => [
          %{"id" => "1", "name" => chef_1_name},
          %{"id" => "2", "name" => chef_2_name}
        ]
      }
    } =
      conn
      |> graphql_query(
        query: """
        {
           chefs {
            id
            name
          }
        }
        """
      )

    assert chef_1_name == "chef_1"
    assert chef_2_name == "chef_2"
  end

  test "query unexisting chef by id", %{conn: conn} do
    id = "3"
    name = "new_name"

    Chefs.put(id, %ChefModel{id: id, name: name})

    %{
      "data" => %{"chef" => nil},
      "errors" => [
        %{
          "locations" => [%{"column" => 4, "line" => 2}],
          "message" => "Chef 33 not found!",
          "path" => ["chef"]
        }
      ]
    } =
      conn
      |> graphql_query(
        query: """
        {
           chef(id: "33") {
            id
            name
          }
        }
        """
      )
  end
end
