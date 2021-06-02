defmodule ElixtronWeb.Router do
  use ElixtronWeb, :router
  use Kaffy.Routes #, scope: "/admin", pipe_through: [:some_plug, :authenticate]
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowEmailConfirmation]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ElixtronWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :put_session_layout do
    plug :put_layout, false
    plug :put_root_layout, {ElixtronWeb.LayoutView, :session}
  end

  scope "/" do
    pipe_through [:browser, :put_session_layout]

    pow_routes()
    pow_extension_routes()
  end

  scope "/", ElixtronWeb do
    pipe_through :browser

    live "/", PageLive, :index
    live "/electron", ElectronLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixtronWeb do
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
      live_dashboard "/dashboard", metrics: ElixtronWeb.Telemetry, ecto_repos: [Elixtron.Repo]
    end
  end
end
