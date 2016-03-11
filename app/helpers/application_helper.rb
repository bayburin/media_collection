module ApplicationHelper

  def link_to_collection(user)
    "http://#{request.host_with_port}/users/#{user.username}"
  end

end
