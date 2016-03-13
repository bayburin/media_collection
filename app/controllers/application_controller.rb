class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def render_empty_collection(type)
    render file: "app/views/collections/empty_#{type}_collection.haml"
  end

  public

  def render_403
    render file: 'public/403.html', status: 403
  end

  def render_404
    render file: 'public/404.html', status: 404
  end

end
