defmodule Basic.Greeting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "greetings" do
    field :message, :string

    timestamps(updated_at: false, type: :utc_datetime)
  end

  @doc false
  def changeset(greeting, attrs) do
    greeting
    |> cast(attrs, [:message])
    |> validate_required([:message])
    |> validate_format(:message, ~r/\D/, message: "must contain only numbers")
  end
end
