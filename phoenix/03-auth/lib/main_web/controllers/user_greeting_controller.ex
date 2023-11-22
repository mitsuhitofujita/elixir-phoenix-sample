defmodule MainWeb.UserGreetingController do
  use MainWeb, :controller

  require Logger

  # alias Main.Repo
  alias Main.Greeting
  alias Main.Accounts.User

  def new(conn, _params) do
    changeset = Greeting.changeset(%Greeting{}, %{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"greeting" => params}) do
    Logger.debug(inspect(params))
    user = conn.assigns.current_user

    changeset = Greeting.changeset(%Greeting{user: user}, params)

    case Main.Repo.insert(changeset) do
      {:ok, _greeting} ->
        conn
        |> put_flash(:info, "Greeting created successfully!")
        |> redirect(to: ~p"/greetings")

      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
