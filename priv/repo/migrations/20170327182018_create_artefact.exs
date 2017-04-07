defmodule College.Repo.Migrations.CreateArtefact do
  use Ecto.Migration

  def change do
    create table(:artefacts , primary_key: false  ) do
      add :id, :uuid, primary_key: true
      add :url, :string
      add :title, :string
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:artefacts, [:user_id])

  end
end
