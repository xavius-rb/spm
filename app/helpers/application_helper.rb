module ApplicationHelper
  def active_menu_class(controller_name)
    params[:controller] == controller_name ? "is-active" : ""
  end
end
