class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.guitar_id = params[:guitar_id]
        @comment.save
        redirect_to guitar_path(params[:guitar_id]) 
    end
    
    def destroy
        comment = Comment.find(params[:id]) 
        guitar = comment.guitar
        comment.destroy
        redirect_to guitar_path(guitar)
    end

    private 

    def comment_params
        params.require(:comment).permit(:remark)
    end
end
