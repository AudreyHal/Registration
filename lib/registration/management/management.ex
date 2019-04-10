defmodule Registration.Management do
  import Ecto.Query, warn: false
  alias  Registration.Management.Student
  alias  Registration.Management.Course
  alias  Registration.Management.Request
  alias  Registration.Repo

  def build_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
  end

  def create_student(attrs) do
    attrs
    |> build_student
    |> Repo.insert
    end


def get_student!(id), do: Repo.get!(Student, id) |> Repo.preload(:courses)


def get_student_by_matno(matno), do: Repo.get_by(Student, matno: matno)

def get_student_by_credentials(%{"matno" => matno, "password"=> pass}) do
  student = get_student_by_matno(matno)


cond do
  student && Comeonin.Bcrypt.checkpw(pass, student.password_hash) ->
  student
  true ->
  :error
end
end


def list_courses do
  Repo.all(Course)
end

def list_dept_courses(dept) do
  list_courses()
  |> Enum.filter(fn(course) -> course.department == dept
  end)
end


def add_course( cid, %Student{} = student) do
Request.changeset(%Request{}, %{student_id: student.id, course_id: cid})
  |>Repo.insert()

end

def get_course!(id), do: Repo.get!(Course, id)

def delete_course(%Course{} = course) do
  Repo.delete(course)
end

end
