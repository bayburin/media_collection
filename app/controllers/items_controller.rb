class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      flash[:success] = "Данные в коллекцию добавлены"
      redirect_to root_path
    else
      flash[:error] = "Ошибка добавления данных. #{ @item.errors.full_messages }"
      render action: :new
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Данные успешно изменены."
      redirect_to root_path
    else
      flash.now[:error] = "Ошибка изменения данных. #{ @item.errors.full_messages }"
      render action: :edit
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    if @item.destroy
      flash[:success] = "Позиция успешно удалена."
    else
      flash[:error] = "Ошибка удаления. #{ @item.errors.full_messages }"
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:description, :link, :image)
  end

end
