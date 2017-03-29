defmodule College.Helpers do

    alias College.Repo
    alias College.User
    alias College.Course
    alias College.UserCourse

    def insert_user(attrs \\ %{}) do
        changes = Dict.merge(%{
            name: "Some User",
            username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}",
            password: "supersecret",
            is_student: true,
            salutation: "dawg",
            forname: "sd" ,
            surname: "ds",
            age: 40,
            location: "stoke",
            photo: "dsasd"
        }, attrs)
    %User{}
        |> User.changeset(changes)
        |> Repo.insert!()
    end


    def insert_course(attrs \\ %{}) do
        changes = Dict.merge(%{
            title: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}"
        }, attrs)
    %Course{}
        |> Course.changeset(changes)
        |> Repo.insert!()
    end

    @doc """
    Builds a User/Course relation based on a user map and a course map.
    """
    def insert_user_course(_user = %{:id => user_id},_course = %{:id => course_id}) do
        changes = %{
              user_id:  user_id,
            course_id:  course_id,
        }
        %UserCourse{}
        |> UserCourse.changeset(changes)
        |> Repo.insert!()
    end

end
