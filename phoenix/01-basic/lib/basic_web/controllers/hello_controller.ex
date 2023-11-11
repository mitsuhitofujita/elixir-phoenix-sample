defmodule BasicWeb.HelloController do
  use BasicWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
