defmodule LibralywebWeb.PageController do
  use LibralywebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
