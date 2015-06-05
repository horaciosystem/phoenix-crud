defmodule PhoenixCustomers.Customer do
  use PhoenixCustomers.Web, :model

  schema "customers" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :age, :integer

    timestamps
  end

  @required_fields ~w(name email bio age)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
