class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        @user = User.new(user_params)
        render :new
        if @user.save!
            login!(@user)
            redirect_to users_url
            flash[:msg] = "Succesfully created. Welcome!"
        else
            flash.now[:errors] = "Invalid username and password. Please try again."
            redirect_to user_url
        end
    end

    def new
        @user = User.new()
        render :new
    end

    def edit
    end

    def show
        @user = User.find(params[:id])
        redirect_to user_url(@user.id)
    end

    def update
        @user = User.find_by(:id[params[:id]])
        if @user.update(user_params)
            redirect_to user_url(user.id)
        else
            render json:user.errors.full_messages, status: 422
        end
    end

    def destroy
        @user = User.find_by(:id[params[:id]])
        @user.destroy
        redirect_to users_url
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :session_token)
    end

end