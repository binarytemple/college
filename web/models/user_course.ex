defmodule College.UserCourse do
  use College.Web, :model

  schema "user_courses" do
    belongs_to :user, College.User
    belongs_to :course, College.Course

    timestamps()
  end

 require Logger

  @required_fields ~w(user_id course_id)
  @optional_fields ~w()
  
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

 def changeset(struct, params \\ %{})

 def changeset(struct, params ) do # end= %{user_id: _, course_id: _} ) do
    Logger.warn("#{inspect(params)}" )
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:course_id)
    |> validate_required([])
  end


end
