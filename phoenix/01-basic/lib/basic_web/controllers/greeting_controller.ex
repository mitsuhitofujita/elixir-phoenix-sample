defmodule BasicWeb.GreetingController do
  use BasicWeb, :controller

  alias Basic.Greeting

  def index(conn, _params) do
    greetings = Basic.Repo.all(Greeting)
    render(conn, :index, greetings: greetings)
  end

  def new(conn, _params) do
    changeset = Greeting.changeset(%Greeting{}, %{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"greeting" => params}) do
    changeset = Greeting.changeset(%Greeting{}, params)

    case Basic.Repo.insert(changeset) do
      {:ok, greeting} ->
        conn
        |> put_flash(:info, "Greeting created successfully!")
        |> render(:create, greeting: greeting)

      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
