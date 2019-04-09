defmodule RegistrationWeb.PageController do
  use RegistrationWeb, :controller

  def index(conn, _params) do
    student = conn.assigns.current_student
    render(conn, "index.html", student: student)
  end
end
