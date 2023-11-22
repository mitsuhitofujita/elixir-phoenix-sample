defmodule MainWeb.GreetingController do
  use MainWeb, :controller

  require Logger

  import Ecto.Query

  alias Main.Repo
  alias Main.Greeting

  def index(conn, _params) do
    greetings = Greeting
    |> join(:inner, [u], _ in assoc(u, :user))
    |> preload([..., u], [user: u])
    |> order_by([desc: :id])
    |> limit(10)
    |> Repo.all()

    Logger.debug(inspect(greetings))
    if conn.assigns[:current_user] do
      render(conn, :index_auth, greetings: greetings)
    else
      render(conn, :index, greetings: greetings)
    end
  end
end
