defmodule RegistrationWeb.Acceptance.ProfilepageTest do
  use Registration.DataCase
  use Hound.Helpers
  hound_session()

  # setup do

  #   alias Registration.Repo
  #   alias Registration.Management.Student
  #   Repo.insert %Student{name: "John",
  #   email : "john@example.com",
  #   password : "secret",
  #   hall : "Area 1",
  #   department : "Chemistry",
  #   level : "100",
  #   matno : "A1111"}

  #   :ok
  # end

  defp login do
    valid_attrs = %{
      "name" => "John",
      "email" => "john@example.com",
      "password" => "secret",
      "hall" => "Area 1",
      "department" => "Chemistry",
      "level" => "100",
      "matno" => "A1111"
      }
      {:ok, _} = Management.create_student(valid_attrs)
        :ok

        navigate_to("/login")
        form = find_element(:id, "login-form")
        find_within_element(form, :name, "session[matno]")
        |> fill_field("A1111")
        find_within_element(form, :name, "session[password]")
        |> fill_field("secret")
        find_within_element(form, :tag, "button")
        |> click
        ## THEN ##
        assert current_path() == "/"
        message = find_element(:class, "alert-info")
        |> visible_text()
        assert message == "Login successful"

  end

  test "presence of student data" do
    login()
      navigate_to("/")
      page_title = find_element(:css, ".title-text") |> visible_text()
      assert page_title ==  "My Profile"
  end
end
