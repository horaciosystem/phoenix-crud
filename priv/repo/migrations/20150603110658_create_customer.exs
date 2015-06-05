defmodule PhoenixCustomers.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string
      add :email, :string
      add :bio, :string
      add :age, :integer

      timestamps
    end

  end
end
