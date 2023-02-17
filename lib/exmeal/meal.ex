defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :date, :calories]

  @json_fields [:id, :description, :date, :calories]

  @derive {Jason.Encoder, only: @json_fields}

  schema "meals" do
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:calories, :integer)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
