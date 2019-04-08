defmodule ManagementWeb.Plugs.Loadstudent do
  import Plug.Conn
  alias Registration.Management
  alias Portal.Management.Student
  def init(_opts), do: nil
  def call(%Plug.Conn{} = conn, _opts) do
    student_id = get_session(conn, :student_id)
    student = student_id && Management.get_student!(student_id)
    assign(conn, :current_student, student)
  end
  end
