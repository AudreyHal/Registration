defmodule RegistrationWeb.SessionController do
  use RegistrationWeb, :controller
  alias  Registration.Management.Student
  alias  Registration.Management



def new(conn, _params) do

  render conn, "new.html"
end


def create(conn, %{"session" => session_params}) do
case Management.get_student_by_credentials(session_params) do
:error ->
conn
|> put_flash(:error, "Invalid mat number/password combo")
student ->
  conn
  |> assign(:current_student, student)
  |> put_session(:student_id, student.id)
  |> configure_session(renew: true)
  |> put_flash(:info, "Login successful")
  |> redirect(to: Routes.page_path(conn, :index))
end
end

def delete(conn, _) do
  clear_session(conn)
  |> put_flash(:info, "You have been logged out")
  |> redirect(to: Routes.page_path(conn, :index))
  end
end

