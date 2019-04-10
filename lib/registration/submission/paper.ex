defmodule Registration.Submission.Paper do
  use Ecto.Schema
  import Ecto.Changeset
  alias Registration.Management.Student

  schema "papers" do
    field :body, :string
    field :department, :string
    field :subject, :string
    field :term, :string
   belongs_to :student, Student

    timestamps()
  end

  @doc false
  def changeset(paper, attrs) do
    paper
    |> cast(attrs, [:subject, :body, :department, :term])
    |> validate_required([:subject, :body, :department, :term])
  end
end
