defmodule MarleySpoonWeb.Resolvers.ChefResolver do
  alias MarleySpoon.Storage.Chefs
  alias MarleySpoon.Model.Chef, as: ChefModel
  alias MarleySpoon.Storage.Entities

  def find(%{id: id}, _parent) do
    case Chefs.get_by_id(id) do
      %ChefModel{id: _id} = chef -> {:ok, chef}
      _ -> {:error, "Chef #{id} not found!"}
    end
  end

  def list_chefs(_args, _parent), do: Entities.all_chefs()
end
