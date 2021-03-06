defmodule PhoenixCustomers.CustomerControllerTest do
  use PhoenixCustomers.ConnCase

  alias PhoenixCustomers.Customer
  @valid_attrs %{age: 42, bio: "some content", email: "some content", name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, customer_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing customers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, customer_path(conn, :new)
    assert html_response(conn, 200) =~ "New customer"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, customer_path(conn, :create), customer: @valid_attrs
    assert redirected_to(conn) == customer_path(conn, :index)
    assert Repo.get_by(Customer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, customer_path(conn, :create), customer: @invalid_attrs
    assert html_response(conn, 200) =~ "New customer"
  end

  test "shows chosen resource", %{conn: conn} do
    customer = Repo.insert %Customer{}
    conn = get conn, customer_path(conn, :show, customer)
    assert html_response(conn, 200) =~ "Show customer"
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    customer = Repo.insert %Customer{}
    conn = get conn, customer_path(conn, :edit, customer)
    assert html_response(conn, 200) =~ "Edit customer"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    customer = Repo.insert %Customer{}
    conn = put conn, customer_path(conn, :update, customer), customer: @valid_attrs
    assert redirected_to(conn) == customer_path(conn, :index)
    assert Repo.get_by(Customer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    customer = Repo.insert %Customer{}
    conn = put conn, customer_path(conn, :update, customer), customer: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit customer"
  end

  test "deletes chosen resource", %{conn: conn} do
    customer = Repo.insert %Customer{}
    conn = delete conn, customer_path(conn, :delete, customer)
    assert redirected_to(conn) == customer_path(conn, :index)
    refute Repo.get(Customer, customer.id)
  end
end
