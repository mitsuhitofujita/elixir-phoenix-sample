defmodule Basic.Repo.Migrations.CreateGreetings do
  use Ecto.Migration

  def change do
    create table(:greetings) do
      add :message, :string, null: false

      timestamps(updated_at: false, type: :utc_datetime)
    end
  end
end
