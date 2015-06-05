defmodule PhoenixCustomers.CustomerTest do
  use PhoenixCustomers.ModelCase

  alias PhoenixCustomers.Customer

  @valid_attrs %{age: 42, bio: "some content", email: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Customer.changeset(%Customer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Customer.changeset(%Customer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
