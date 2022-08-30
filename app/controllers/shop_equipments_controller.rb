class ShopEquipmentsController < ApplicationController

    def new
        @evolution = Shop.find(params[:shop_id])
    end

    def create
        @evolution = Shop.find(params[:shop_id])

        @equipment = @evolution.equipments.create!(equipment_params)
            
            @equipment.save
            
            redirect_to "/shops/#{@evolution.id}/equipments"
    end

    def index
        @evolution = Shop.find(params[:shop_id])
        @new_evolution = @evolution.equipments.order(params[:sort])
    end

    private

    def equipment_params
        params.permit(:brand, :price, :in_stock)
    end
end