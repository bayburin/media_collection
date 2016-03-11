class CollectionsController < ApplicationController

  def index
    @collection = Collection.where(user_id: current_user.id).includes(:items).first
    if @collection.items.count.zero?
      render_empty_collection 'your'
    end
  end

  def show
    @collection = Collection.find(params[:id])
    @user = @collection.user

    # удалить
    user_info = @collection.user
    @username = user_info.username

    if @collection.items.count.zero?
      render_empty_collection 'user'
    end
  end

end
