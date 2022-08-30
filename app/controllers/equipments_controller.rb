class EquipmentsController < ApplicationController
    def new

    end
    
    def index
        @equipment = Equipment.where(in_stock: true)
    end

    def edit
        @equipment = Equipment.find(params[:id])
    end

    def update
        @equipment = Equipment.find(params[:id])
        @equipment.update(equipment_params)
        @equipment.save

        redirect_to "/equipments/#{@equipment.id}"
    end
    
    def show
        @equipment = Equipment.find(params[:id])
    end

    def destroy
        @equipment = Equipment.find(params[:id])
        
        @equipment.destroy
        redirect_to "/equipments"
    end


    private

    def equipment_params
        params.permit(:brand, :price, :in_stock)
    end
end