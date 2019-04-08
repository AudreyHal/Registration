defmodule Registration.Management.Request do
  use Ecto.Schema
  import Ecto.Changeset
  alias  Registration.Management.Student
  alias  Registration.Management.Course
  alias Registration.Management.Request

  schema "requests" do
    belongs_to :student, Student
    belongs_to :course, Course
    timestamps()
  end

  @doc false
  def changeset(%Request{} = request, attrs) do
    request
    |> cast(attrs, [:student_id, :course_id])
    |> validate_required([])
  end
end
