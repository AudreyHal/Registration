defmodule Registration.Submission do
  @moduledoc """
  The Submission context.
  """
  alias Registration.Management.Student
  import Ecto.Query, warn: false
  alias Registration.Repo

  alias Registration.Submission.Paper

  @doc """
  Returns the list of papers.

  ## Examples

      iex> list_papers()
      [%Paper{}, ...]

  """
  def list_student_papers(student) do
    student
    |> Ecto.assoc(:papers)
    |> Repo.all
  end

  @doc """
  Gets a single paper.

  Raises `Ecto.NoResultsError` if the Paper does not exist.

  ## Examples

      iex> get_paper!(123)
      %Paper{}

      iex> get_paper!(456)
      ** (Ecto.NoResultsError)

  """
  def get_student_paper!(student, id) do
    student
    |> Ecto.assoc(:papers)
    |> Repo.get!(id)

  end

  @doc """
  Creates a paper.

  ## Examples

      iex> create_paper(%{field: value})
      {:ok, %Paper{}}

      iex> create_paper(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_student_paper(%Student{} = student, attrs \\ %{}) do
    build_student_paper( student, attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a paper.

  ## Examples

      iex> update_paper(paper, %{field: new_value})
      {:ok, %Paper{}}

      iex> update_paper(paper, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_paper(%Paper{} = paper, attrs) do
    paper
    |> Paper.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Paper.

  ## Examples

      iex> delete_paper(paper)
      {:ok, %Paper{}}

      iex> delete_paper(paper)
      {:error, %Ecto.Changeset{}}

  """
  def delete_paper(%Paper{} = paper) do
    Repo.delete(paper)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking paper changes.

  ## Examples

      iex> change_paper(paper)
      %Ecto.Changeset{source: %Paper{}}

  """
  def build_student_paper(%Student{} = student, attrs \\ %{}) do
    Ecto.build_assoc(student, :papers, %{term: "Alpha"})
    |> Paper.changeset(attrs)


  end
end
