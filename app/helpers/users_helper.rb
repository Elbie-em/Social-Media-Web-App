# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity

module UsersHelper
  def not_current_user_btn(user)
    request_button(user) if user != current_user
  end

  def request_button(user)
    if User.sent_request(current_user, user)
      link_to('Cancel Request', friend_request_path(id: User.sent_request(current_user, user).id), method: :delete, class: 'request_btn')
    elsif User.received_request(current_user, user)
      links = [link_to('Accept Request', friendships_path(status: true, requestee_id: current_user.id, requester_id: user.id), method: :post, class: 'request_btn'), link_to('Reject Request', friend_request_path(id: User.received_request(current_user, user).id), method: :delete, class: 'sp request_btn')]

      content_tag(:span) do
        links.collect { |link| concat content_tag(:span, link) }
      end
    elsif User.friendship(current_user, user)
      link_to('Remove Friend', friendship_path(id: User.friendship(current_user, user).id), method: :delete, class: 'request_btn')
    elsif User.sent_request(current_user, user).nil? && User.received_request(current_user, user).nil? && User.friendship(current_user, user).nil?
      link_to('Send Friend Request', friend_requests_path(requester_id: current_user.id, requestee_id: user.id), method: :post, class: 'request_btn')
    end
  end

  def user_posts(current_user, user, posts)
    if User.friendship(current_user, user) || user == current_user
      render partial: posts
    else
      content_tag(:span, 'You cannot view the posts of this user until you are friends!')
    end
  end
end

# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
