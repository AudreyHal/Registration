defmodule RegistrationWeb.PaperControllerTest do
  use RegistrationWeb.ConnCase

  alias Registration.Submission

  @create_attrs %{body: "some body", department: "some department", subject: "some subject", term: "some term"}
  @update_attrs %{body: "some updated body", department: "some updated department", subject: "some updated subject", term: "some updated term"}
  @invalid_attrs %{body: nil, department: nil, subject: nil, term: nil}

  def fixture(:paper) do
    {:ok, paper} = Submission.create_paper(@create_attrs)
    paper
  end

  describe "index" do
    test "lists all papers", %{conn: conn} do
      conn = get(conn, Routes.paper_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Papers"
    end
  end

  describe "new paper" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.paper_path(conn, :new))
      assert html_response(conn, 200) =~ "New Paper"
    end
  end

  describe "create paper" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.paper_path(conn, :create), paper: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.paper_path(conn, :show, id)

      conn = get(conn, Routes.paper_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Paper"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.paper_path(conn, :create), paper: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Paper"
    end
  end

  describe "edit paper" do
    setup [:create_paper]

    test "renders form for editing chosen paper", %{conn: conn, paper: paper} do
      conn = get(conn, Routes.paper_path(conn, :edit, paper))
      assert html_response(conn, 200) =~ "Edit Paper"
    end
  end

  describe "update paper" do
    setup [:create_paper]

    test "redirects when data is valid", %{conn: conn, paper: paper} do
      conn = put(conn, Routes.paper_path(conn, :update, paper), paper: @update_attrs)
      assert redirected_to(conn) == Routes.paper_path(conn, :show, paper)

      conn = get(conn, Routes.paper_path(conn, :show, paper))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, paper: paper} do
      conn = put(conn, Routes.paper_path(conn, :update, paper), paper: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Paper"
    end
  end

  describe "delete paper" do
    setup [:create_paper]

    test "deletes chosen paper", %{conn: conn, paper: paper} do
      conn = delete(conn, Routes.paper_path(conn, :delete, paper))
      assert redirected_to(conn) == Routes.paper_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.paper_path(conn, :show, paper))
      end
    end
  end

  defp create_paper(_) do
    paper = fixture(:paper)
    {:ok, paper: paper}
  end
end
