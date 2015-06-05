defmodule PhoenixCustomers.PageController do
  use PhoenixCustomers.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
