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

  def profile_picture(user)
    unless user.photo?
      content_tag(
        :div,
        nil,
        class: 'profile-picture mr-3',
        style: "background-image: url('http://res.cloudinary.com/dw7kyau11/image/upload/v1604074097/andjdrop1uryj09ka5y3.png');"
      )
    else
      content_tag(
        :div,
        nil,
        class: 'profile-picture mr-3',
        style: "background-image: url('#{user.photo}');")
    end
  end

  def cover_image(user)
    unless user.cover_image?
      content_tag(
        :div,
        nil,
        class: 'cover-image mr-3',
        style: "background-image: url('https://res.cloudinary.com/dw7kyau11/image/upload/v1604077934/ia9865jkmz0unwhpruwu.jpg');"
      )
    else
      content_tag(
        :div,
        nil,
        class: 'cover-image',
        style: "background-image: url('#{user.cover_image}');")
    end
  end
end
