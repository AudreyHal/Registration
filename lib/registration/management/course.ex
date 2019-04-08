defmodule Registration.Management.Course do
  use Ecto.Schema
  import Ecto.Changeset
  alias Registration.Management.Student


  schema "courses" do
    field :code, :integer
    field :credits, :integer
    field :department, :string
    field :title, :string
    many_to_many(
      :students,
     Student,
      join_through: "requests",
      on_replace: :delete
)


    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:title, :code, :credits, :department])
    |> validate_required([:title, :code, :credits, :department])
  end
end
