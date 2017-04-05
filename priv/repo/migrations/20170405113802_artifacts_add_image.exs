defmodule College.Repo.Migrations.ArtifactsAddImage do
  use Ecto.Migration

  def change do

    alter table(:artefacts) do
      add :image, :string
    end

  end
end
