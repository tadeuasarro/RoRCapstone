module PostsHelper
  def suggestions_button(user)
    capture do
      link_to 'Follow', followings_path(
        following: {
          follower_id: current_user.id,
          followed_id: user.id,
          route: posts_path
        }
      ),
              method: 'post',
              class: 'p-1 rounded btn-primary small no-link'
    end
  end
end
