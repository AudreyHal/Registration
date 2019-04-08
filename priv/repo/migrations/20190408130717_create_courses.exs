defmodule Registration.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :title, :string
      add :code, :integer
      add :credits, :integer
      add :department, :string

      timestamps()
    end

  end
end
