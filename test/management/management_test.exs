defmodule Registration.ManagementTest do
  use Registration.DataCase
  alias Registration.Management
  alias Registration.Management.Student

  test "build_customer/0 returns a student changeset" do
    assert %Ecto.Changeset{data: %Student{}} = Management.build_student
  end

  test "build_customer/1 returns a student changeset with values
applied" do
attrs = %{"name" => "John"}
changeset = Management.build_student(attrs)
assert changeset.params == attrs
end
