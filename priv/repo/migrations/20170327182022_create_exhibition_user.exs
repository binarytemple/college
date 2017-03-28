defmodule College.Repo.Migrations.CreateExhibitionUser do
  use Ecto.Migration

  def change do
    create table(:exhibitions_users) do
      add :title, :string
      add :description, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :exhibition_id, references(:exhibitions, on_delete: :nothing)

      timestamps()
    end
    create index(:exhibitions_users, [:user_id])
    create index(:exhibitions_users, [:exhibition_id])

  end
end
