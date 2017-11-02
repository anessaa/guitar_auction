class BidsController < ApplicationController
    def create
        @bid = Bid.new(bid_params)
        @bid.user = current_user
        @bid.guitar_id = params[:guitar_id]
        if @bid.amount < @bid.guitar.start_bid
            flash[:notice] = "Your bid must be greater than starting bid"   
            redirect_to guitar_path(params[:guitar_id])
        else
            @bid.save
            redirect_to guitar_path(params[:guitar_id])
        end
    end

    def destroy
        bid = Bid.find(params[:id]) 
        guitar = bid.guitar
        bid.destroy
        redirect_to guitar_path(guitar)
    end

    private 

    def bid_params
        params.require(:bid).permit(:amount)
    end
end