defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_attrs [:description, :date, :calories]

  @json_fields [:id, :description, :date, :calories]

  @derive {Jason.Encoder, only: @json_fields}

  schema "meals" do
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:calories, :integer)

    timestamps()
  end

  def changeset(meal \\ %__MODULE__{}, attrs) do
    meal
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint(:date)
  end
end
