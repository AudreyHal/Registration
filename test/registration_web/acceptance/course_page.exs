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

  test "succesfully navigate to course page" do
    login()
      navigate_to("/courses")
      page_title = find_element(:css, ".title-text") |> visible_text()
      assert page_title ==  "My Profile"

      table = find_element(:css, ".table")
      table_code = find_within_element(product, :css, ".code") |> visible_text()
      table_title = find_within_element(product, :css, ".title") |> visible_text()
      table_credits = find_within_element(product, :css, ".credits") |> visible_text()
      assert table_code  == "Code"
      assert table_title == "Title"
      assert table_credits == "Credits"


  end
end
