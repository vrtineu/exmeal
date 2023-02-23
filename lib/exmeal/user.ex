defmodule Exmeal.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_attrs [:name, :email, :cpf]

  @derive {Jason.Encoder, only: @required_attrs ++ [:id, :meals]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :cpf, :string
    has_many :meals, Meal

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:name, min: 3, max: 255)
  end
end
