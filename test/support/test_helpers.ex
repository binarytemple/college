defmodule College.TestHelpers do

alias College.Repo

    def insert_user(attrs \\ %{}) do
        changes = Dict.merge(%{
            name: "Some User",
            username: "user#{Base.encode16(:crypto.rand_bytes(8))}",
            password: "supersecret",
            is_student: true,
            salutation: "dawg",
            forname: "sd" ,
            surname: "ds",
            age: 40,
            location: "stoke",
            photo: "dsasd"
        }, attrs)
    %College.User{}
        |> College.User.changeset(changes)
        |> College.insert!()
    end

    #def insert_video(user, attrs \\ %{}) do user
    #|> Ecto.build_assoc(:videos, attrs)
    #    |> Repo.insert!()
    #end

end