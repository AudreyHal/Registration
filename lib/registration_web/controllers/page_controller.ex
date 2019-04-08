defmodule RegistrationWeb.PageController do
  use RegistrationWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
