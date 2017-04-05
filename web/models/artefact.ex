defmodule College.Artefact do
  use College.Web, :model
  use Arc.Ecto.Schema
  use Arc.Definition
  use Arc.Ecto.Definition

  schema "artefacts" do
    field :url, :string
    field :title, :string
    field :description, :string
    field :image, College.Image.Type
    belongs_to :user, College.User

    timestamps()
  end

  @required ~w()
  @optional ~w(url, title, description)
  @required_file_fields ~w(image)
  @optional_file_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required)
    |> cast_attachments(params, @required_file_fields , @optional_file_fields)
    #    |> validate_required(@required  )
  end
end
