defmodule PhoenixCustomers.CustomerController do
  use PhoenixCustomers.Web, :controller

  alias PhoenixCustomers.Customer

  plug :scrub_params, "customer" when action in [:create, :update]

  def index(conn, _params) do
    customers = Repo.all(Customer)
    render(conn, "index.html", customers: customers)
  end

  def new(conn, _params) do
    changeset = Customer.changeset(%Customer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"customer" => customer_params}) do
    changeset = Customer.changeset(%Customer{}, customer_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Customer created successfully.")
      |> redirect(to: customer_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Repo.get(Customer, id)
    render(conn, "show.html", customer: customer)
  end

  def edit(conn, %{"id" => id}) do
    customer = Repo.get(Customer, id)
    changeset = Customer.changeset(customer)
    render(conn, "edit.html", customer: customer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Repo.get(Customer, id)
    changeset = Customer.changeset(customer, customer_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Customer updated successfully.")
      |> redirect(to: customer_path(conn, :index))
    else
      render(conn, "edit.html", customer: customer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Repo.get(Customer, id)
    Repo.delete(customer)

    conn
    |> put_flash(:info, "Customer deleted successfully.")
    |> redirect(to: customer_path(conn, :index))
  end
end
