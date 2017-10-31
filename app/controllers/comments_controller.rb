class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.guitar_id = params[:guitar_id]
        @comment.save
        redirect_to guitar_path(params[:guitar_id]) 
    end
    def show 
    end
    private 

    def comment_params
        params.require(:comment).permit(:remark)
    end
end
