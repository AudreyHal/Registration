defmodule Registration.Repo.Migrations.CreateRequests do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :student_id, references(:students, on_delete: :delete_all)
      add :course_id, references(:courses, on_delete: :delete_all)

      timestamps()
    end

    create index(:requests, [:student_id])
    create index(:requests, [:course_id])
    
  end
end
