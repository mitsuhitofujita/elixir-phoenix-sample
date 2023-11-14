defmodule Main.Repo.Migrations.CreateGreetings do
  use Ecto.Migration

  def change do
    create table(:greetings) do
      add :message, :string

      timestamps(updated_at: false, type: :utc_datetime)
    end
  end
end
