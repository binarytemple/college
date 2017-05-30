defmodule College.Repo.Migrations.AddProviderUidIndexToCredential do
  use Ecto.Migration

  def change do
			drop constraint(:credentials, "credentials_pkey")

    alter table(:credentials) do
			#drop index(:credentials, :id)
			modify :id, :text, default: ""
		end

    rename table(:credentials), :id, to: :uid
    create index(:credentials, [:uid, :provider], unique: true)
  end
end
