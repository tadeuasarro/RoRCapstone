module UsersHelper
  def follow_button(user)
    return if user.id == current_user.id

    if current_user.follower_relations.where(followed_id: user.id).first
      capture do
        link_to 'Unfollow', following_path(
          id: current_user.follower_relations.where(followed_id: user.id).ids
        ),
                method: 'delete',
                class: 'p-1 rounded btn-danger small no-link'
      end
    else
      capture do
        link_to 'Follow', followings_path(
          following: {
            follower_id: current_user.id,
            followed_id: user.id,
            route: users_path
          }
        ),
                method: 'post',
                class: 'p-1 rounded btn-primary small no-link'
      end
    end
  end
end
