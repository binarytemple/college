defmodule College.Repo.Migrations.CreateCourse do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :title, :string

      timestamps()
    end

  end
end
