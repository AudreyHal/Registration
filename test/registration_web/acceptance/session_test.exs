defmodule RegistrationWeb.Acceptance.SessionTest do
  use Registration.DataCase
  use Hound.Helpers
  hound_session()
  setup do
  ## GIVEN ##
  # There is a valid registered user
  alias Registration.Management
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
  end
  ## Test should be added here.

  test "login with valid data" do
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
end
