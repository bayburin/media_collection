class CollectionsController < ApplicationController

  def index
    @collection = current_user
    if @collection.items.count.zero?
      render_empty_collection 'your'
    end
  end

end

