defmodule College.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add :strategy, :string
      add :email, :string
      add :password, :string
      add :token1, :string

      timestamps()
    end

  end
end
