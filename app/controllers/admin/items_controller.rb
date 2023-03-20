class Admin::ItemsController < ApplicationController
  
def new
end

def create 
@item = Item.new(item_params)
@item.save
#redirect_to admin_item_path
end
  
def index
end

end

