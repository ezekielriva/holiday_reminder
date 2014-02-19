module ApplicationHelper
  def is_active_menu(item)
    return 'active' if item === controller_name
    false
  end
end
