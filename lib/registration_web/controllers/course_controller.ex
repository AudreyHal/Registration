defmodule RegistrationWeb.CourseController do
  use RegistrationWeb, :controller
  alias Registration.Management.Student
  alias Registration.Management
  alias Registration.Management.Course
  alias Registration.Repo

  def index(conn, _params) do
  #  student =conn.assigns.student
  current_student = conn.assigns.current_student
    course = Management.list_dept_courses(current_student.department)
    render(conn, "index.html", course: course )
  end


    def create(conn, %{ "course" => course_params}) do
      student = conn.assigns.current_student
      course_id = Map.get(course_params, "course_id")
      case Management.add_course(course_id, student) do
        {:ok,_} ->
          conn
          |> put_flash(:info, "Course Added successfully.")
          |> redirect(to: Routes.course_path(conn, :view))

        {:error, %Ecto.Changeset{} = changeset} ->
          conn
          |> put_flash(:info, "Memo already  sent to this user.")
          |> redirect(to: Routes.course_path(conn, :index))
       #   render conn, "index.html"
      end
end

def view(conn, _params) do
  current_student = conn.assigns.current_student
student = Management.get_student!(current_student.id)
render(conn, "view.html", student: student)
end
end
