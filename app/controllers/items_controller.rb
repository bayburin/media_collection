class ItemsController < ApplicationController

  # before_action :load_collection

  def new
    @collection = current_user.collection
    @item       = Item.new
  end

  def create
    @item = current_user.collection.items.new(item_params)
    if @item.save
      flash[:success] = "Данные в коллекцию добавлены"
      redirect_to root_path
    else
      flash[:error] = "Ошибка добавления данных"
      render action: :new
    end
  end

  def edit
    @collection = current_user.collection
    @item       = @collection.items.find(params[:id])
  end

  def update
    @item = current_user.collection.items.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Данные успешно изменены."
      redirect_to root_path
    else
      # @item.errors.full_messages
      flash.now[:error] = "Ошибка изменения данных."
      render action: :edit
    end
  end

  def destroy
    @item = current_user.collection.items.find(params[:id])
    if @item.destroy
      flash[:success] = "Позиция успешно удалена."
    else
      flash[:error] = "Ошибка удаления."
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:description, :link, :image)
  end

  # def load_collection
  #   @collection = current_user.collection
  #   raise ActiveRecord::RecordNotFound if @collection.id != params[:collection_id].to_i
  # end

end
