class ShopEquipmentsController < ApplicationController

    def new

    end

    def create
        @evolution = Shop.find(params[:id])

        @equipment = @evolution.equipments.create!({
            brand: params[:equipment][:brand],
            price: params[:equipment][:price],
            in_stock: params[:equipment][:in_stock]
            })
            
            @equipment.save
            
            redirect_to "/shops/#{@evolution.id}/equipments/"
    end

    def edit
        @evolution = Shop.find(params[:id])
    end

    def index
        @evolution = Shop.find(params[:shop_id])
    end
end