defmodule ExmealWeb.UsersView do
  use ExmealWeb, :view

  def render("create.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      inserted_at: user.inserted_at,
      updated_at: user.updated_at
    }
  end
end
