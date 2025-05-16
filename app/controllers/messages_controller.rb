class MessagesController < ApplicationController

    before_action :set_message, only: [:show, :edit, :update]
    before_action :set_users, only: [:new, :create, :edit, :update]
    before_action :set_chats, only: [:new, :create, :edit, :update]

    def index
        @messages = Message.all
    end

    def show
        @user = @message.sender
        @chat = @message.chat
    end

    def new
        @message = Message.new
    end

    def create
        @message = Message.new message_params

        if @message.save
            redirect_to messages_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @message.update message_params
            redirect_to messages_path
        else
            render :edit
        end
    end

    private
    def set_message
        @message = Message.find(params["id"])
    end

    def set_users
        @users = User.all
    end

    def set_chats
        @chats = Chat.all
    end

    def message_params
        params.require(:message).permit(:chat_id, :user_id, :body)
    end
end