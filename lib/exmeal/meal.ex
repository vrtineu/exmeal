defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_attrs [:description, :date, :calories]

  @json_fields [:id, :description, :date, :calories]

  @derive {Jason.Encoder, only: @json_fields}

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)

    belongs_to(:user, User)

    timestamps()
  end

  def changeset(meal \\ %__MODULE__{}, attrs) do
    meal
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
    |> validate_length(:description, min: 3, max: 255)
    |> validate_number(:calories, greater_than: 0)
  end
end
