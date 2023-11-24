defmodule Main.Greeting do
  use Ecto.Schema
  import Ecto.Changeset

  alias Main.Accounts.User

  schema "greetings" do
    field :message, :string

    belongs_to :user, User

    timestamps(updated_at: false, type: :utc_datetime)
  end

  @doc false
  def changeset(greeting, attrs) do
    greeting
    |> cast(attrs, [:message])
    |> validate_required([:message, :user])
  end
end
