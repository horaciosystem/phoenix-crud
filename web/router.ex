defmodule PhoenixCustomers.Router do
  use PhoenixCustomers.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixCustomers do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/customers", CustomerController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixCustomers do
  #   pipe_through :api
  # end
end
