defmodule AudionationsWeb.PageController do
  use AudionationsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
