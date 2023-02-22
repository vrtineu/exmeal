defmodule Exmeal.User do
  use Ecto.Schema

  alias Exmeal.Meal

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:cpf, :string)

    has_many(:meals, Meal)

    timestamps()
  end
end
