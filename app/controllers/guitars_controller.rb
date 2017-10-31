class GuitarsController < ApplicationController
    before_action :authorize, except: [:index]

    def index
        @guitars = Guitar.active
    end

    def new
        @guitar = Guitar.new
    end

    def create
        @guitar = Guitar.new(guitar_params)
        @guitar.user = current_user 
        if @guitar.save 
            flash[:notice] = "You have created a new Guitar Auction"
            redirect_to guitar_path(@guitar)
        else
            render :new
        end
    end

    def show
        @guitar = Guitar.find(params[:id])
        @comment = Comment.new
        @bid = Bid.new
    end

    private 

    def guitar_params
        params.require(:guitar).permit(:image, :brand, :style, :auction_end)
    end
end