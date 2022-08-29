class ShopsController < ApplicationController
    
    def new
        
    end
    
    def create
        @shop = Shop.create!(
            name: params[:name],
            ratings: params[:ratings],
            is_open: params[:is_open]
            )
            
            @shop.save
            
            redirect_to '/shops'
    end

    def edit
        @shop = Shop.find(params[:id])
    end

    def update
        @shop = Shop.find(params[:id])
        @shop.update(
          name: params[:name],
          ratings: params[:ratings],
          is_open: params[:is_open]
          )
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

end