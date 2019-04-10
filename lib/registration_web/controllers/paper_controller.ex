defmodule RegistrationWeb.PaperController do
  use RegistrationWeb, :controller

  alias Registration.Submission
  alias Registration.Submission.Paper

  def index(conn, _params) do
    student = conn.assigns.current_student
    papers = Submission.list_student_papers(student )
    render(conn, "index.html", papers: papers)
  end

  def new(conn, _params) do
    student = conn.assigns.current_student
   changeset = Submission.build_student_paper(student)
    #changeset = Submission.change_paper(%Paper{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"paper" => paper_params}) do
    student = conn.assigns.current_student
    case Submission.create_student_paper(student, paper_params) do
      {:ok, paper} ->
        conn
        |> put_flash(:info, "Paper created successfully.")
        |> redirect(to: Routes.paper_path(conn, :show, paper))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    student = conn.assigns.current_student
    paper = Submission.get_student_paper!(student, id)
    render(conn, "show.html", paper: paper)
  end

  
end
