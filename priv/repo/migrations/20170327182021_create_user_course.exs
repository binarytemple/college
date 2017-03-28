defmodule College.Repo.Migrations.CreateUserCourse do
  use Ecto.Migration

  def change do
    create table(:user_courses) do
      add :user_id, references(:users, on_delete: :nothing)
      add :course_id, references(:courses, on_delete: :nothing)

      timestamps()
    end
    create index(:user_courses, [:user_id])
    create index(:user_courses, [:course_id])

  end
end
