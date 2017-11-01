class BidsController < ApplicationController
    def create
        @bid = Bid.new(bid_params)
        @bid.guitar_id = params[:guitar_id]
        @bid.save
        redirect_to guitar_path(params[:guitar_id])
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