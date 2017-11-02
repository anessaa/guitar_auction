class UsersController < ApplicationController

    def new
        @user = User.new
    end
 
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "You have successfully signed up!"
            redirect_to root_path
        else
            render :new
        end
    end
    
    def show
        @guitars_won = Guitar.won(current_user)
    end
    def edit
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image)
    end
end