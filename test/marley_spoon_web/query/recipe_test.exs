defmodule MarleySpoonWeb.Query.RecipeTest do
  @moduledoc false
  use MarleySpoonWeb.ConnCase
  alias MarleySpoon.Storage.{Chefs, Recipes}
  alias MarleySpoon.Model.Recipe, as: RecipeModel
  alias MarleySpoon.Model.Chef, as: ChefModel

  setup do
    cleanup_ets()

    :ok
  end

  test "query recipe by id", %{conn: conn} do
    recipe_id = "3"
    recipe_title = "new_title"
    recipe_description = "new_description"

    Recipes.put(recipe_id, %RecipeModel{
      id: recipe_id,
      title: recipe_title,
      description: recipe_description
    })

    %{"data" => %{"recipe" => %{"id" => id, "title" => title, "description" => description}}} =
      conn
      |> graphql_query(
        query: """
        {
           recipe(id: "3") {
            id
            title
            description
          }
        }
        """
      )

    assert id == recipe_id
    assert title == recipe_title
    assert description == recipe_description
  end

  test "query recipe with chef by id", %{conn: conn} do
    chef_id = "1"
    chef_name = "john_smith"

    recipe_id = "3"
    recipe_title = "new_title"
    recipe_description = "new_description"

    Chefs.put(chef_id, %ChefModel{id: chef_id, name: chef_name})

    Recipes.put(recipe_id, %RecipeModel{
      id: recipe_id,
      title: recipe_title,
      description: recipe_description,
      chef_id: chef_id
    })

    %{
      "data" => %{
        "recipe" => %{
          "chef" => %{"id" => id, "name" => name},
          "description" => "new_description",
          "id" => "3",
          "title" => "new_title"
        }
      }
    } =
      conn
      |> graphql_query(
        query: """
        {
           recipe(id: "3") {
            id
            title
            description
            chef {
              id
              name
            }
          }
        }
        """
      )

    assert id == chef_id
    assert name == chef_name
  end

  test "query all recips", %{conn: conn} do
    Recipes.put("1", %RecipeModel{id: "1", title: "title_1", description: "description_1"})
    Recipes.put("2", %RecipeModel{id: "2", title: "title_2", description: "description_2"})

    %{
      "data" => %{
        "recipes" => [
          %{"description" => description_1, "id" => "1", "title" => title_1},
          %{"description" => description_2, "id" => "2", "title" => title_2}
        ]
      }
    } =
      conn
      |> graphql_query(
        query: """
        {
           recipes {
            id
            title
            description
          }
        }
        """
      )

    assert description_1 == "description_1"
    assert description_2 == "description_2"
    assert title_1 == "title_1"
    assert title_2 == "title_2"
  end

  test "query unexisting recipe by id", %{conn: conn} do
    id = "3"
    title = "new_title"

    Recipes.put(id, %RecipeModel{id: id, title: title})

    %{
      "data" => %{"recipe" => nil},
      "errors" => [
        %{
          "locations" => [%{"column" => 4, "line" => 2}],
          "message" => "Recipe 33 not found!",
          "path" => ["recipe"]
        }
      ]
    } =
      conn
      |> graphql_query(
        query: """
        {
           recipe(id: "33") {
            id
            title
            description
          }
        }
        """
      )
  end
end
