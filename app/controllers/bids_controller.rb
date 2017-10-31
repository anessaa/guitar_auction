class BidsController < ApplicationController
    def create
        @bid = Bid.new(params[:bid][:amount])
        @bid.user = current_user
        @bid.guitar_id = params[:guitar_id]
        @bid.save
        redirect_to guitar_path(params[:guitar_id])
    end
end