defmodule ExmealWeb.UsersController do
  use ExmealWeb, :controller

  alias Exmeal.User

  action_fallback ExmealWeb.FallbackController

  def create(conn, attrs) do
    with {:ok, user} <- Exmeal.create_user(attrs) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, user} <- Exmeal.get_user_by_id(id) do
      conn
      |> render("user.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Exmeal.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, attrs) do
    with {:ok, %User{} = user} <- Exmeal.update_user(attrs) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
