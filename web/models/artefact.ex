defmodule College.Artefact do
  use College.Web, :model
  use Arc.Ecto.Schema
  use Arc.Definition
  use Arc.Ecto.Definition

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "artefacts" do
    field :title, :string
    field :description, :string
    field :image, College.Image.Type
    belongs_to :user, College.User

    timestamps()
  end

  @required ~w(id )a
  @optional ~w(title description)a
  @required_file_fields ~w(image)a
  @optional_file_fields ~w()a
	@required_for_validation ~w(id image)a

  def changeset(struct, params \\ %{})  do 
    struct 
    |> cast(params, @required, @optional) 
    |> cast_attachments(params, @required_file_fields , @optional_file_fields)
    |> validate_required(@required_for_validation)
  end 

end
