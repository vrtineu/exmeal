defmodule Exmeal.Users.Update do
  alias Exmeal.{Error, Repo, User}

  def call(%{"id" => id} = attrs) do
    with %User{} = user <- Repo.get(User, id) do
      update_user(user, attrs)
    else
      nil -> {:error, Error.new_not_found_user()}
    end
  end

  defp update_user(user, attrs) do
    user = User.changeset(user, attrs)
    Repo.update(user)
  end
end
