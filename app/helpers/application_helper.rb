module ApplicationHelper
  def hidden_element?
    params[:controller] == ("devise/sessions" || "devise/registrations")
  end
end
