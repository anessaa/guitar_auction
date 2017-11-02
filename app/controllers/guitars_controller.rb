class GuitarsController < ApplicationController
    before_action :authorize, except: [:index]

    def index
        if params[:guitar] && params[:guitar][:brand] && params[:guitar][:brand] != ''
            @guitars = Guitar.active.where(brand: params[:guitar][:brand])
        else
            @guitars = Guitar.active
        end
    end

    def show
        @guitar = Guitar.find(params[:id])
        @comment = Comment.new
        @bid = Bid.new
        @highest_bid = @guitar.bids.order("amount DESC").first
        @starting_bid = @guitar.start_bid
        @past_bid = Date.today > @guitar.auction_end
    end

    def history
        @guitars = Guitar.past
    end

    def new
        @guitar = Guitar.new
    end

    def create
        params[:guitar][:brand] = params[:guitar][:brand].capitalize
        params[:guitar][:style] = params[:guitar][:style].capitalize
        @guitar = Guitar.new(guitar_params)
        @guitar.user = current_user 
        if @guitar.save 
            flash[:notice] = "You have created a new Guitar Auction"
            redirect_to guitar_path(@guitar)
        else
            render :new
        end
    end

    def edit
        @guitar = Guitar.find(params[:id])
    end

    def update 
        if @guitar.update_attributes(guitar_params)
            redirect_to guitar_path
        else
            render :edit
        end
    end


    def destroy
        @guitar = Guitar.find(params[:id])
        @guitar.destroy
        redirect_to user_path
    end
    
    private 

    def guitar_params
        params.require(:guitar).permit(:image, :brand, :style, :start_bid, :auction_end)
    end
end