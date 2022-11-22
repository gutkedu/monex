defmodule Monex.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  alias Monex.Account

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:value, :debited_account_id, :credited_account_id]

  schema "transaction" do
    field :value, :float

    belongs_to :debited_account, Account
    belongs_to :credited_account, Account

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:value, greater_than_or_equal_to: 0)
  end
end
