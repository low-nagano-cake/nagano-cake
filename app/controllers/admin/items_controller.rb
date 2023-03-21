class Admin::ItemsController < ApplicationController
  
def new
end

def create 
 @item = Item.new(item_params)
 @item.save
 redirect_to admin_items_path
end
  
def index
 @items = Item.all
end


private
  def item_params
   params.permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
  
end
