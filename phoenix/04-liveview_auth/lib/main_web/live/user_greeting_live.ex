defmodule MainWeb.UserGreetingLive do
  use MainWeb, :live_view

  require Logger

  import Ecto.Query

  alias Main.Repo
  alias Main.Greeting

  def mount(_sesstion, _params, socket) do
    user = socket.assigns.current_user

    greetings = Repo.all(
      from g in Greeting,
        where: g.user_id == ^user.id,
        limit: 10,
        order_by: [desc: g.id],
        select: [:message]
    )

    {:ok,
     socket
     |> assign(:form, to_form(%{}))
     |> stream(:greetings, greetings)}
  end

  def handle_event("submit", %{"message" => message}, socket) do
    user = socket.assigns.current_user
    changeset = Greeting.changeset(%Greeting{user: user}, %{message: message})

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
