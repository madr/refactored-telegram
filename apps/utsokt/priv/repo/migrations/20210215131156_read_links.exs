defmodule Utsokt.Repo.Migrations.ReadLinks do
  use Ecto.Migration

  def change do
    alter table(:links) do
      add :read?, :boolean, default: false
    end

    index(:links, [:url, :title, :read?])
  end
end
