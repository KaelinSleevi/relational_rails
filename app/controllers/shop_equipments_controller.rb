class ShopEquipmentsController < ApplicationController
    def index
        @evolution = Shop.find(params[:shop_id])
    end
end