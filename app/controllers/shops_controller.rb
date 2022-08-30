class ShopsController < ApplicationController
    
    def new
        
    end
    
    def create
        @shop = Shop.create!(shop_params)
            
            
            redirect_to '/shops'
    end

    def edit
        @shop = Shop.find(params[:id])
    end

    def update
        @shop = Shop.find(params[:id])
        @shop.update(shop_params)
        @shop.save

        redirect_to "/shops/#{@shop.id}"
    end
    
    def index
        @shops = Shop.all.order(created_at: :desc)
    end
    
    def show
        @shop = Shop.find(params[:id])
    end

    def destroy
        @shop = Shop.find(params[:id])

        @shop.destroy
        redirect_to "/shops"
    end


    private

    def shop_params
        params.permit(:name, :ratings, :is_open)
    end

end