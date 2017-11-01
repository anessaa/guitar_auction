class BidsController < ApplicationController
    def create
        @bid = Bid.new(bid_params)
        @bid.user = current_user
        @bid.guitar_id = params[:guitar_id]
        @bid.save
        redirect_to guitar_path(params[:guitar_id])
    end

    def show
    end


    private 

    def bid_params
        params.require(:bid).permit(:amount)
    end
end