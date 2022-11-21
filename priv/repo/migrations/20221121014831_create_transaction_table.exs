defmodule Monex.Repo.Migrations.CreateTransactionTable do
  use Ecto.Migration

  def change do
    create table(:transaction) do
      add :debited_account_id, references(:account)
      add :credited_account_id, references(:account)
      add :value, :numeric

      timestamps()
    end
  end
end
