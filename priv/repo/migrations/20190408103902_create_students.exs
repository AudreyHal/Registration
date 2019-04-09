defmodule Registration.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext"
    create table(:students) do

      add :name, :string
      add :email, :citext
      add :matno, :string
      add :hall, :string
      add :level, :integer
      add :department, :string
      add :password, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:students, [:matno])
  end
end
