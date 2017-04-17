defmodule College.UserCourse do
  use College.Web, :model

  schema "user_courses" do
    belongs_to :user, College.User
    belongs_to :course, College.Course

    timestamps()
  end

 require Logger

  @required_fields ~w(user_id course_id)
  @optional_fields ~w(id)
  
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

 def changeset(struct, params \\ %{})

 def changeset(struct, params ) do # end= %{user_id: _, course_id: _} ) do
    #Logger.warn("#{inspect(params)}" )
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:course_id)
    |> unique_constraint(:user_id, name: :user_courses_user_id_course_id_index,message: "combination of course_id + user_id must be unique " )
    |> unique_constraint(:course_id, name: :user_courses_user_id_course_id_index, message: "combination of course_id + user_id must be unique " )
    |> validate_required([])
  end


end
