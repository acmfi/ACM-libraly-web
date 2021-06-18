defmodule Libralyweb.Models.Books do
  use Ecto.Schema

  schema "books" do
    field :ISBN, :string
    field :title, :string
    field :author, :string
    field :edition, :string
    field :publisher, :string
    field :is_borrowed, :boolean, default: false
    field :borrowed_by, :string

    timestamps()
  end

  def changeset(book, params \\ %{}) do
    book
    |> Ecto.Changeset.cast(params, [:book])
  end

  def insert_book(book) do
    case Libralyweb.Repo.insert(book) do
      {:ok, _} = res_ok -> res_ok
      _ -> {:error, {:something_went_wrong, "Could not insert book"}}
    end
  end

  def remove_book(isbn) do
    case Libralyweb.Repo.delete(isbn) do
      {:ok, _} = res_ok -> res_ok
      _ -> {:error, {:something_went_wrong, "Could not remove book"}}
    end
  end

  def edit_book(book) do
    case Libralyweb.Repo.update(book) do
      {:ok, _} = res_ok -> res_ok
      _ -> {:error, {:something_went_wrong, "Could not edit book info"}}
    end
  end
end
