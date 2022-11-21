defmodule Monex.Repo.Migrations.CreateAccountTable do
  use Ecto.Migration

  def change do
    create table(:account) do
      add :balance, :numeric

      timestamps()
    end
  end
end
