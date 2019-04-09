defmodule Registration.Management.Student do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]
  alias Registration.Management.Student
  alias Registration.Management.Course


  schema "students" do
    field :email, :string
    field :hall, :string
    field :level, :integer
    field :matno, :string
    field :name, :string
    field :department, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    many_to_many(
      :courses,
      Course,
      join_through: "requests",
      on_replace: :delete
)

    timestamps()
  end

  @doc false
  def changeset(%Student{} =student, attrs) do
    student
    |> cast(attrs, [:name, :email, :matno, :hall, :level, :password, :department])
    |> validate_required([:name, :email, :matno, :hall, :level, :password, :department])
    |> validate_format(:email, ~r/@/, message: "is invalid")
    |> validate_length(:password, min: 6, max: 100)

    |> unique_constraint(:matno)
    |> put_hashed_password()

  end


  def put_hashed_password(changeset) do

    case changeset.valid? do
      true ->
      changes = changeset.changes
      put_change(changeset, :password_hash, hashpwsalt(changes.password))
      _ ->
      changeset

end
end
end
