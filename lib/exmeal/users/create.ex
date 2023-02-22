defmodule Exmeal.Users.Create do
  alias Ecto.Changeset
  alias Exmeal.{Error, Repo, User}

  def call(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
    |> handle_result()
  end

  defp handle_result({:ok, %User{}} = result), do: result

  defp handle_result({:error, %Changeset{} = result}) do
    {:error, Error.new(result, :bad_request)}
  end
end
