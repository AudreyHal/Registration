defmodule Registration.ManagementTest do
  use Registration.DataCase
  alias Registration.Management
  alias Registration.Management.Student

  test "build_student/0 returns a student changeset" do
    assert %Ecto.Changeset{data: %Student{}} = Management.build_student
  end

  test "build_student/1 returns a student changeset with values
applied" do
attrs = %{"name" => "John"}
changeset = Management.build_student(attrs)
assert changeset.params == attrs
end

test "create_student/1 returns a student for valid data" do
  valid_attrs = %{
  "name" => "John",
  "matno" => "aaaaa",
  "email" => "john@example.com",
  "password" => "secret",
  "hall" => "Area 1",
  "department" => "Area 1",
  "level" => "1111"
  }
  assert {:ok, student} = Management.create_student(valid_attrs)
  assert Comeonin.Bcrypt.checkpw(valid_attrs["password"],
  student.password_hash)
  end

  test "create_customer/1 returns a changeset for invalid data" do
  invalid_attrs = %{}
  assert {:error, %Ecto.Changeset{}} = Management.create_student(invalid_attrs)
  end

  test "get_customer_by_student" do
    valid_attrs = %{
      "name" => "John",
      "matno" => "aaaaa",
      "email" => "john@example.com",
      "password" => "secret",
      "hall" => "Area 1",
      "department" => "Area 1",
      "level" => "1111"
      }
    {:ok, student1} = Management.create_student(valid_attrs)
    student2 = Management.get_student_by_matno("aaaaa")
    assert student1.id == student2.id
    end
end
