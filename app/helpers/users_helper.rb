# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity

module UsersHelper
  def no_current_user_btn(user)
    request_btn(user) if user != current_user
  end

  def request_btn(user)
    if @sent_request
      link_to('Cancel Request', friend_request_path(id: @sent_request.id), method: :delete, class: 'request_btn')
    elsif @received_request
      links = [link_to('Accept Request', friendships_path(status: true, requestee_id: current_user.id, requester_id: user.id), method: :post, class: 'request_btn'), link_to('Reject Request', friend_request_path(id: @received_request.id), method: :delete, class: 'sp request_btn')]

      content_tag(:span) do
        links.collect { |link| concat content_tag(:span, link) }
      end
    elsif @friendship
      link_to('Remove Friend', friendship_path(id: @friendship.id), method: :delete, class: 'request_btn')
    elsif @accepted_friendship
      link_to('Remove Friend', friendship_path(id: @accepted_friendship.id), method: :delete, class: 'request_btn')
    elsif @sent_request.nil? && @received_request.nil? && @friendship.nil?
      link_to('Send Friend Request', friend_requests_path(requester_id: current_user.id, requestee_id: user.id), method: :post, class: 'request_btn')
    end
  end
end

# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
