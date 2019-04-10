defmodule Registration.Repo.Migrations.CreatePapers do
  use Ecto.Migration

  def change do
    create table(:papers) do
      add :subject, :string
      add :body, :text
      add :department, :string
      add :term, :string
      add :student_id, references(:students, on_delete: :nothing)

      timestamps()
    end

    create index(:papers, [:student_id])
  end
end
