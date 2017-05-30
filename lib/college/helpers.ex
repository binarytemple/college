defmodule College.Helpers do

    alias College.Repo
    alias College.User
    alias College.Course
    alias College.UserCourse
    import Ecto.Query
    
    def validate_user(uid,pass_to_check) do
      user = Repo.get_by(User, email: uid)
      nil_or_val = fn nil -> {:error} ; v -> {:ok,v} end

      with {:ok, %{:password => password}} <- nil_or_val.( Repo.get_by(User, email: uid) ),
           {:ok,hashed_password}  <- nil_or_val.(password) , 
           r <- Comeonin.Bcrypt.checkpw(pass_to_check, hashed_password), 
           do: r
    end
    
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
            dob: Ecto.Date.cast("1985-01-01")       , 
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

    def search_user(name, threshold \\ 0.15, limit \\ 10) do
      #res = Repo.query(
      #"""
      #SELECT salutation, forname, surname, dob_y, dob_m, dob_d, fulltext_name <-> $1 AS dist FROM users ORDER BY dist ASC LIMIT $2
      #""", [search_term, limit] )
      #Repo.all(from(u in User, order_by: fragment("similarity(fulltext_name,?) DESC",^name), limit: limit ))
      Repo.all(
              from(u in User, 
                  where: not(is_nil(u.fulltext_name)),
                  where: fragment("similarity(fulltext_name,?) > ?", ^name,^threshold),  
                  order_by: fragment("similarity(fulltext_name,?) DESC",^name),  
                  limit: ^limit)
            )

#Repo.all(from(u in User, where: fragment("similarity(fulltext_name,?) < ?", ^name,0.9),  order_by: fragment("similarity(fulltext_name,?) DESC",^name), limit: 10 ))
#
#
#      case res do
#      {:ok, %Postgrex.Result{:rows => rows}} -> rows
#      end

       
    end

end
