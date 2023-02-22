defmodule ExmealWeb.UsersController do
  use ExmealWeb, :controller

  def create(conn, attrs) do
    with {:ok, user} <- Exmeal.create_user(attrs) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
