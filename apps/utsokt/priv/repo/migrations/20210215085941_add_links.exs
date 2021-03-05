defmodule Utsokt.Repo.Migrations.AddLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string
      add :title, :string
      add :excerpt, :string, default: ""
      add :source, :string, default: "web"

      timestamps()
    end

    index(:links, [:url, :title])
  end
end
