defmodule College.ExhibitionUser do
  use College.Web, :model

  schema "exhibitions_users" do
    field :title, :string
    field :description, :string
    belongs_to :user, College.User
    belongs_to :exhibition, College.Exhibition

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description])
    |> validate_required([:title, :description])
  end
end
