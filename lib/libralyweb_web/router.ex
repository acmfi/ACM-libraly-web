defmodule LibralywebWeb.Router do
  use LibralywebWeb, :router

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

  scope "/", LibralywebWeb do
    pipe_through :browser

    get("/", BookController, :index)

  end

  # scope "/api/books", LibralywebWeb do
  #   pipe_through :api

  #   post("/", BookController, :add_book)
  #   get("/", BookController, :get_books)
  #   get("/:id", BookController, :get_book)
  #   delete("/:id", BookController, :remove_book)
  #   put("/:id", BookController, :edit_book)
  # end

  # Other scopes may use custom stacks.
  # scope "/api", LibralywebWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: LibralywebWeb.Telemetry
    end
  end
end
