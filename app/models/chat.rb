class Chat < ApplicationRecord
    belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
    belongs_to :sender, class_name: "User", foreign_key: :sender_id
    has_many :messages

    validates :sender_id, presence: true
    validates :receiver_id, presence: true
    validate :different_users

    def different_users
        if self.sender_id == self.receiver_id
            errors.add(:sender_id, "must be different from receiver")
        end
    end

    def participants
        "#{id} (#{sender.first_name} -> #{receiver.first_name})"
    end
end