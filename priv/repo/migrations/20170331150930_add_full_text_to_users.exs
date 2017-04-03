defmodule College.Repo.Migrations.AddFullTextToUsers do
  use Ecto.Migration

  def change do

    alter table(:users) do
      add :fulltext_name, :string
    end

    execute "CREATE EXTENSION pg_trgm;"

    execute "CREATE INDEX trgm_idx ON users USING GIN (fulltext_name gin_trgm_ops);"

  end
end
