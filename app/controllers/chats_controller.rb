class ChatsController < ApplicationController
    
    before_action :set_chat, only: [:show, :edit, :update]
    before_action :set_users, only: [:new, :create, :edit, :update]
    before_action :authenticate_user!, only:[:new, :edit, :show, :index]

    load_and_authorize_resource
    
    def index
        @chats = Chat.all
    end

    def show
        @messages = @chat.messages
    end

    def new
        @chat = Chat.new
    end

    def create
        @chat = Chat.new chat_params
        if @chat.save
            redirect_to chats_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @chat.update chat_params
            redirect_to chats_path
        else
            render :edit
        end
    end

    private
    def set_chat
        @chat = Chat.find(params["id"])
    end

    def set_users
        @users = User.all
    end

    def chat_params
        params.require(:chat).permit(:sender_id, :receiver_id)
    end
end