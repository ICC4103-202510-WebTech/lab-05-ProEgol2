class MessagesController < ApplicationController
    def index
        @messages = Message.all
    end

    def show
        @message = Message.find(params["id"])
    end

    def new
        @message = Message.new
        @users = User.all
        @chats = Chat.all
    end

    def create
        @message = Message.new message_params
        @users = User.all
        @chats = Chat.all

        if @message.save
            redirect_to messages_path
        else
            render :new
        end
    end

    private
    def message_params
        params.require(:message).permit(:chat_id, :user_id, :body)
    end
end