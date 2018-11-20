defmodule AudionationsWeb.PageController do
  use AudionationsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def catalog_index(conn, params \\ %{} )do
    render(conn, "catalog.html")
  end

  
  def cart(conn, params \\ %{} )do
    render(conn, "cart.html")
  end


end
