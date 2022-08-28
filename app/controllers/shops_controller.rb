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

    def edit
        @shop = Shop.find(params[:id])
    end

    def update
        @shop = Shop.find(params[:id])
        @shop.update({
          name: params[:shop][:name],
          ratings: params[:shop][:ratings],
          is_open: params[:shop][:is_open]
          })
        @shop.save

        redirect_to "/shops/#{@shop.id}"
    end
    
    def index
         @shops = Shop.all.order(created_at: :desc)
    end
    
     def show
         @shop = Shop.find(params[:id])
    end

end