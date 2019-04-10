defmodule RegistrationWeb.Plugs.LoadStudentTest do
  use RegistrationWeb.ConnCase
  alias Registration.Management
  alias Registration.Management.Student


  @valid_attrs  %{
    "name" => "John",
    "matno" => "aaaaa",
    "email" => "john@example.com",
    "password" => "secret",
    "hall" => "Area 1",
    "department" => "Area 1",
    "level" => "1111"
    }
  test "fetch customer from session on subsequent visit" do

  {:ok, student} = Management.create_student(@valid_attrs)

  conn = post build_conn(), "/login", %{"session" =>
  @valid_attrs }

  conn = get conn, "/"

  assert student.id == conn.assigns.current_student.id
  end
end
