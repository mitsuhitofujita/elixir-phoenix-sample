defmodule Main.Repo.Migrations.CreateGreetingsTable do
  use Ecto.Migration

  def change do
    create table(:greetings) do
      add :message, :string

      add :user_id, references(:users), null: false

      timestamps(updated_at: false, type: :utc_datetime)
    end
  end
end
