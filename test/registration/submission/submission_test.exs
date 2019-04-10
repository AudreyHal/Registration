defmodule Registration.SubmissionTest do
  use Registration.DataCase

  alias Registration.Submission

  describe "papers" do
    alias Registration.Submission.Paper

    @valid_attrs %{body: "some body", department: "some department", subject: "some subject", term: "some term"}
    @update_attrs %{body: "some updated body", department: "some updated department", subject: "some updated subject", term: "some updated term"}
    @invalid_attrs %{body: nil, department: nil, subject: nil, term: nil}

    def paper_fixture(attrs \\ %{}) do
      {:ok, paper} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Submission.create_paper()

      paper
    end


end
