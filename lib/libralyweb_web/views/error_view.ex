defmodule LibralywebWeb.ErrorView do
  use LibralywebWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  def render("400.json", %{err_msg: err_msg}) do
    %{errors: %{detail: err_msg}}
  end

  def render("404.json", %{err_msg: err_msg}) do
    %{errors: %{detail: err_msg}}
  end

  def render("404.json", _assigns) do
    %{errors: %{detail: "Page not found"}}
  end

  def render("500.json", _assigns) do
    %{errors: %{detail: "Internal Server Error"}}
  end

  def template_not_found(_template, assigns) do
    render("500.json", assigns)
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  # def template_not_found(template, _assigns) do
  #   Phoenix.Controller.status_message_from_template(template)
  # end

end
