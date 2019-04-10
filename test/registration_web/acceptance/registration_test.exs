defmodule RegistrationWeb.Acceptance.RegistrationTest do
  use Registration.DataCase
  use Hound.Helpers
  hound_session()
  # Add test functions here


test "registers an account with valid data" do
  navigate_to("/signup")
  form = find_element(:id, "registration-form")
  find_within_element(form, :name, "student[name]")
  |> fill_field("John")
  find_within_element(form, :name, "student[email]")
  |> fill_field("john@example.com")
  find_within_element(form, :name, "student[matno]")
  |> fill_field("jjjjj")
  find_element(:css, "#student_department option[value='Chemistry']") |> click()
  find_within_element(form, :name, "student[level]")
  |> fill_field("1111")
  find_within_element(form, :name, "student[hall]")
  |> fill_field("esther")
  find_within_element(form, :name, "student[password]")
    |> fill_field("password")
  find_within_element(form, :tag, "button")
  |> click
  assert current_path == "/login"
  message = find_element(:class, "alert")
  |> visible_text()
  assert message == "You must be signed in"
  end
end
