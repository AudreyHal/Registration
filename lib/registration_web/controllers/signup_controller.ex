defmodule RegistrationWeb.SignupController do
  use RegistrationWeb, :controller
  alias  Registration.Management.Student
  alias  Registration.Management

  def new(conn, _params) do
    changeset = Management.build_student()
    render(conn, "new.html", changeset: changeset)
  end


  def create(conn, %{"student" => student_params}) do
    case Management.create_student(student_params) do
      {:ok, student} ->
      conn
      |> put_flash(:info, "Registration successful")
      |> redirect(to: Routes.page_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
  end
end
end
