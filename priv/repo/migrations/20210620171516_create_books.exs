defmodule Boom.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :ISBN, :string, primary_key: true
      add :author, :string
      add :title, :string
      add :publisher, :string
      add :edition, :string
      add :is_borrowed, :boolean, default: false, null: false
      add :borrowed_by, :string

      timestamps()
    end
  end
end