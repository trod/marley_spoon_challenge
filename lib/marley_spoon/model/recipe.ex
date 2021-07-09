defmodule MarleySpoon.Model.Recipe do
  use MarleySpoon.Model.Base

  @fields ~w(id title description chef_id)a
  @required_fields @fields -- [:chef_id]

  @primary_key false
  embedded_schema do
    field(:id, :string)
    field(:title, :string)
    field(:description, :string)
    field(:chef_id, :string)
  end

  @impl true
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end
end
