defmodule College.Repo.Migrations.CreateExhibition do
  use Ecto.Migration

  def change do
    create table(:exhibitions) do
      add :title, :string
      add :description, :string

      timestamps()
    end

  end
end
