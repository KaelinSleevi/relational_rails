class ShopEquipmentsController < ApplicationController

    def new
        #  require "pry"; binding.pry
        @evolution = Shop.find(params[:shop_id])
    end

    def create
        @evolution = Shop.find(params[:shop_id])

        @equipment = @evolution.equipments.create!({
            brand: params[:equipment][:brand],
            price: params[:equipment][:price],
            in_stock: params[:equipment][:in_stock]
            })
            
            @equipment.save
            
            redirect_to "/shops/#{@evolution.id}/equipments"
    end

    def index
        @evolution = Shop.find(params[:shop_id])
    end
end