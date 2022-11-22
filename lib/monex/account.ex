defmodule Monex.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Monex.Transaction

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:balance]

  schema "account" do
    field :balance, :float, default: 100.0

    has_many :cash_in_transactions, {"credited_account", Transaction}
    has_many :cash_out_transactions, {"debited_account", Transaction}

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:value, greater_than_or_equal_to: 0)
  end
end
