defmodule Inmana.Repo.Migrations.CreateSuppliesTable do
  use Ecto.Migration
  alias Inmana.Supply

  def change do
    create table(:supplies) do
      add :description, :string
      add :expiration_date, :date
      add :responsible, :string
      add :restaurant_id, references(:restaurants, type: :binary_id)

      has_many :supplies, Supply

      timestamps()
    end
  end
end
