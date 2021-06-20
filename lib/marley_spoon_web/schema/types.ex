defmodule MarleySpoonWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias MarleySpoon.Storage.Entities

  @desc "A recipe"
  object :recipe do
    field(:id, :string)
    field(:title, :string)
    field(:description, :string)

    field(:chef, :chef,
      resolve: fn parent, _args, _context ->
        Entities.get_chef_by_recipe_id(parent.id)
      end
    )
  end

  @desc "A chef of the recipe"
  object :chef do
    field(:id, :string)
    field(:name, :string)
  end
end
