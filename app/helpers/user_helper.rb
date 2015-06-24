module UserHelper
  def get_navigation_class link_name, page_param
    if (page_param.nil? && link_name == t("user.basic")) || page_param == link_name
      "active"
    end
  end

  def get_row_class_of_table project_user
    if project_user.status == Settings.project.status.doing
      "active"
    end
  end
end
