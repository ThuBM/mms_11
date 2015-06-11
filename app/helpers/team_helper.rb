module TeamHelper
  def get_navigation_class link_name, page_param
    if (page_param.nil? && link_name == Settings.team.basic) || page_param == link_name
      "active"
    end
  end
end