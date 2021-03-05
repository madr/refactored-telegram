defmodule Utsokt.Link do
  use Ecto.Schema

  import Ecto.{
    Changeset,
    Query
  }

  alias Utsokt.Repo

  @valid_sources ["web", "pocket", "feed"]
  @default_source "web"
  @topic inspect(__MODULE__)

  schema "links" do
    field :url, :string
    field :title, :string
    field :excerpt, :string, default: ""
    field :source, :string, default: @default_source
    field :read?, :boolean, default: false

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:url, :title, :source, :read?])
    |> validate_required([:url, :title])
    |> validate_inclusion(:source, @valid_sources)
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Utsokt.PubSub, @topic)
  end

  defp unread_query(), do: from(l in __MODULE__, where: not l.read?)

  defp archived_query(), do: from(l in __MODULE__, where: l.read?)

  def unread() do
    Repo.all(unread_query())
  end

  def archived() do
    Repo.all(archived_query())
  end

  def counts() do
    %{
      unread: Repo.aggregate(unread_query(), :count, :id),
      archived: Repo.aggregate(archived_query(), :count, :id)
    }
  end
end
