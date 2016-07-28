defmodule JsonApi.Router do
  use JsonApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JsonApi do
    pipe_through :browser

    get "/", PageController, :index

    resources "/posts", PostController
  end

  scope "/api/v1", JsonApi.Api do
    pipe_through :api

    get "/posts", PostController, :index
    get "/posts/:id", PostController, :show
  end
end
