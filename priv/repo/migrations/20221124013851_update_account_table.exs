defmodule Monex.Repo.Migrations.UpdateAccountTable do
  use Ecto.Migration

  def change do
    alter table(:account) do
      add :user_id, references(:user)
    end
  end
end
