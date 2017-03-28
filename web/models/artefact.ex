defmodule College.Artefact do
  use College.Web, :model

  schema "artefacts" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, College.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
  end
end
