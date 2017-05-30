defmodule College.User do
  use College.Web, :model

  schema "users" do
    field :is_student, :boolean, default: false
    field :salutation, :string
    field :forname, :string
    field :surname, :string
    field :email, :string
    field :email_confirmation, :string, virtual: true
    field :dob, Ecto.Date
    field :fulltext_name, :string
    field :location, :string
    field :photo, :string
    field :password, :string
    field :password_supplied, :string, virtual: true
    field :password_supplied_confirmation, :string, virtual: true
    field :dist, :float, virtual: true

    timestamps()
  end


  @optional_fields [:is_student, :salutation, :forname, :surname, :email, :dob, :location, :photo]
  @required_fields [:is_student, :salutation, :forname, :surname , :email, :dob]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params,@optional_fields  )
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
    |> validate_confirmation(:email, message: "does not match email") 
  end

  #def edit_password_changeset(struct, params \\ %{}) do
  #  fields = [ :password_supplied , :password_supplied_confirmation ]
  #  struct
  #  |> cast(params,fields )
  #  |> validate_required(fields)
  #  |> validate_confirmation(:password_supplied, message: "does not match password") 
  #end

end
