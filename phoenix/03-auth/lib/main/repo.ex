defmodule Main.Repo do
  use Ecto.Repo,
    otp_app: :main,
    adapter: Ecto.Adapters.SQLite3
end
