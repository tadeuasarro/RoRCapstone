module UsersHelper
  def follow_button(user, path)
    return if user.id == current_user.id

    if current_user.follower_relations.where(followed_id: user.id).first
      icon = content_tag(:i, nil, class: 'fas fa-minus')
      capture do
        link_to icon, following_path(
          id: current_user.follower_relations.where(followed_id: user.id).ids,
          route: path
        ),
                method: 'delete',
                class: 'follow-button',
                id: 'follow-button'
      end
    else
      icon = content_tag(:i, nil, class: 'fas fa-plus')
      capture do
        link_to icon, followings_path(
          following: {
            follower_id: current_user.id,
            followed_id: user.id,
            route: path
          }
        ),
                method: 'post',
                class: 'follow-button',
                id: 'follow-button'
      end
    end
  end
end
