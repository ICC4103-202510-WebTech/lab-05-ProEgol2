class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]
    before_action :authenticate_user!, only:[:new, :edit, :show]

    load_and_authorize_resource

    def index
        @users = User.all
    end

    def show
        @chats = Chat.where(sender_id: @user).or(Chat.where(receiver_id: @user))
        @messages = @user.sent_messages
    end

    def new
        @user = User.new
        @user.created_at
    end

    def create
        @user = User.new user_params
        if @user.save
            redirect_to users_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update user_params
            redirect_to users_path
        else
            #flash[:alert] = "#{@user.errors.full_messages.join(", ")}"
            #redirect_to edit_user_path(User.find(@user.id))
            render :edit
        end
    end

    private
    def set_user
        @user = User.find(params["id"])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end
end