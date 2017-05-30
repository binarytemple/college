defmodule College.Repo.Migrations.MovePasswordFromCredentialToUser do
  use Ecto.Migration

  def change do

    alter table(:users) do
      add :password, :string
    end

    alter table(:credentials) do
      remove :email
      remove :password
      remove :token1
      add :token, :binary
      add :provider, :string
      modify :id, :string
    end

  end
end
