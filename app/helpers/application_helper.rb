# :nodoc:
module ApplicationHelper
  def if_notice(notice)
    result_tag = content_tag(:div,
                             content_tag(:p,
                                         notice),
                             class: 'alert alert-warning pb-0 mb-0 text-center')

    return result_tag if notice
  end

  def if_alert(alert)
    result_tag = content_tag(:div,
                             content_tag(:p,
                                         alert),
                             class: 'alert alert-danger pb-0 mb-0 text-center')

    return result_tag if alert
  end

  def current_user
    user = User.find(session[:user_id])
    return user if user
  end
end
