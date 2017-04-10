defmodule College.Repo.Migrations.UsersAddUniqueEmail do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :email, :string, null: false
    end

    create unique_index(:users, [:email])

  end
end
