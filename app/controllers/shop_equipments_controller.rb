class ShopEquipmentsController < ApplicationController

    def new
        @evolution = Shop.find(params[:shop_id])
    end

    def create
        @evolution = Shop.find(params[:shop_id])

        @equipment = @evolution.equipments.create!(
            brand: params[:brand],
            price: params[:price],
            in_stock: params[:in_stock]
            )
            
            @equipment.save
            
            redirect_to "/shops/#{@evolution.id}/equipments"
    end

    def index
        @evolution = Shop.find(params[:shop_id])
        @new_evolution = @evolution.equipments.order(:brand)
    end
end