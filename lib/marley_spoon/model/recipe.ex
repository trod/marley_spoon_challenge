defmodule MarleySpoon.Model.Recipe do
  import Ecto.Changeset
  alias MarleySpoon.Model.Chef

  use Ecto.Schema

  @type t() :: %__MODULE__{}

  @type from_map_req() :: %{
          :id => binary(),
          :title => binary(),
          :description => binary(),
          :chef_id => binary()
        }

  @primary_key false
  embedded_schema do
    field(:id, :string)
    field(:title, :string)
    field(:description, :string)
    field(:chef_id, :string)
  end

  @fields ~w(id title description chef_id)a

  @required_fields @fields -- [:chef_id]

  @spec from_map(from_map_req()) :: {:ok, t()} | {:error, {:invalid_recipe_map, [keyword()]}}
  def from_map(map) when is_map(map) do
    case apply_action(changeset(map), :insert) do
      {:error, changeset} ->
        {:error, {:invalid_recipe_map, changeset.errors}}

      {:ok, %__MODULE__{} = recipe} ->
        {:ok, recipe}
    end
  end

  @spec changeset(map) :: Ecto.Changeset.t()
  defp changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end
end
