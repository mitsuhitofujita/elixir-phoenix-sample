defmodule MainWeb.GreetingLive do
  use MainWeb, :live_view

  require Logger

  import Ecto.Query

  alias Main.Repo
  alias Main.Greeting

  def mount(_sesstion, _params, socket) do
    greetings = Greeting
      |> order_by([desc: :id])
      |> limit(10)
      |> Repo.all()
    socket =
      socket
      |> assign(:form, to_form(%{}))
      |> stream(:greetings, greetings, limit: 10)

    {:ok, socket}
  end

  def handle_event("submit", %{"message" => message}, socket) do
    changeset = Greeting.changeset(%Greeting{}, %{message: message})
    case Main.Repo.insert(changeset) do
      {:ok, greeting} ->
        Logger.debug(inspect(greeting))
        {:noreply, stream_insert(socket, :greetings, greeting, at: 0)}

      {:error, _changeset} ->
	      Logger.error(inspect(changeset))
        {:noreply, socket}
    end
  end
end
