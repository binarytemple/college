defmodule College.Repo.Migrations.AddUniqueUserCourseToUserCourse do
  use Ecto.Migration

  def change do
    create index(:user_courses, [:user_id, :course_id],unique: true)

  end
end

