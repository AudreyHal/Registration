defmodule RegistrationWeb.CourseView do
  use RegistrationWeb, :view
  alias  Registration.Management.Student
  alias  Registration.Management.Course
  alias  Registration.Management.Request

  def render("index.json", %{ course_params: course_params})
  do

  %{
  message: "Course Added"

  }
  end


end
