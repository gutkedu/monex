defmodule Monex.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Monex.Account

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:username, :password]

  schema "user" do
    field :username, :string
    field :name, :string

    has_one :account, Account

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3, max: 25)
    |> validate_format(:email, ~r/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})/)
    |> unique_constraint([:username])
  end
end
