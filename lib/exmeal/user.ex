defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @required_attrs [:name, :email, :cpf]

  schema "users" do
    field :name, :string
    field :email, :string
    field :cpf, :string

    has_many(:meals, Meal)

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
    |> validate_length(:name, min: 3, max: 255)
    |> validate_format(:email, ~r/@/)
  end
end
