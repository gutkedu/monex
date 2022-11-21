defmodule Monex.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :username, :string
      add :password, :string
      add :account_id, references(:account)

      timestamps()
    end
  end
end
