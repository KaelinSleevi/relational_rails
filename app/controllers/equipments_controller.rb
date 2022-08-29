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
        @equipment.update({
          brand: params[:equipment][:brand],
          price: params[:equipment][:price],
          in_stock: params[:equipment][:in_stock]
          })
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

end