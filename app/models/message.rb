class Message < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: :user_id
    belongs_to :chat

    before_validation :normalize

    validates :user_id, presence: true
    validates :chat_id, presence: true
    validates :chat, presence: true
    validates :body, presence: true
    validate :valid_sender

    def normalize
        self.body = body.strip
    end

    def valid_sender
        return if chat.nil? || user_id.nil?

        if user_id != chat.sender_id
            errors.add(:user_id, "must match the chat's sender_id")
        end
    end

    def receiver
        return chat.receiver_id
    end
end