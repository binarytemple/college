defmodule College.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :is_student, :boolean, default: false, null: false
      add :salutation, :string
      add :forname, :string
      add :surname, :string
      add :dob_y, :integer
      add :dob_m, :integer
      add :dob_d, :integer
      add :location, :string
      add :photo, :string

      timestamps()
    end

  end
end
