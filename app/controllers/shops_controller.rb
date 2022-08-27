class ShopsController < ApplicationController
    
    def new
        
    end
    
    def create
        @shop = Shop.create!({
            name: params[:shop][:name],
            ratings: params[:shop][:ratings],
            is_open: params[:shop][:is_open]
            })
            
            @shop.save
            
            redirect_to '/shops'
    end

    def index
         @shops = Shop.all.order(:created_at)
    end
    
     def show
         @shop = Shop.find(params[:id])
    end
end