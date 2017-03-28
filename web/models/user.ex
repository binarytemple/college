defmodule College.User do
  use College.Web, :model

  schema "users" do
    field :is_student, :boolean, default: false
    field :salutation, :string
    field :forname, :string
    field :surname, :string
    field :age, :integer
    field :location, :string
    field :photo, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:is_student, :salutation, :forname, :surname, :age, :location, :photo])
    |> validate_required([:is_student, :salutation, :forname, :surname, :age, :location, :photo])
  end
end
