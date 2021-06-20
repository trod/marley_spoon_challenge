defmodule MarleySpoonWeb.Schema do
  alias MarleySpoonWeb.Resolvers.{ChefResolver, RecipeResolver}
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(MarleySpoonWeb.Schema.Types)

  query do
    @desc "Get a chef by id"
    field :chef, :chef do
      arg(:id, non_null(:string))

      resolve(&ChefResolver.find/2)
    end

    field :recipe, :recipe do
      arg(:id, non_null(:string))

      resolve(&RecipeResolver.find/2)
    end

    field :chefs, list_of(:chef) do
      resolve(&ChefResolver.list_chefs/2)
    end

    field :recipes, list_of(:recipe) do
      resolve(&RecipeResolver.list_recipes/2)
    end
  end
end
