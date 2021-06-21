defmodule LibralywebWeb.PageController do
  use LibralywebWeb, :controller

  def index(conn, params) do
    render(conn, "index.html")
  end
end
