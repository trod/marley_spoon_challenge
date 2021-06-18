defmodule MarleySpoon.Model.Chef do
  import Ecto.Changeset

  use Ecto.Schema

  @type t() :: %__MODULE__{}

  @type from_map_req() :: %{
          :name => binary(),
          :id => binary()
        }

  @primary_key false
  embedded_schema do
    field(:name, :string)
    field(:id, :string)
  end

  @required_fields ~w(name id)a

  @spec from_map(from_map_req()) :: {:ok, t()} | {:error, {:invalid_chef_map, [keyword()]}}
  def from_map(map) when is_map(map) do
    case apply_action(changeset(map), :insert) do
      {:error, changeset} ->
        {:error, {:invalid_chef_map, changeset.errors}}

      {:ok, %__MODULE__{} = chef} ->
        {:ok, chef}
    end
  end

  @spec changeset(map) :: Ecto.Changeset.t()
  defp changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
