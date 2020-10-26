# :nodoc:
module ApplicationHelper
  def if_notice(notice)
    if notice
      result_tag = content_tag(:div,
                               content_tag(:p,
                                           notice),
                               class: 'alert alert-warning pb-0 mb-0 text-center')
      result_tag
    end
  end

  def if_alert(alert)
    if alert
      result_tag = content_tag(:div,
                               content_tag(:p,
                                           alert),
                               class: 'alert alert-danger pb-0 mb-0 text-center')
      result_tag
    end
  end

end
