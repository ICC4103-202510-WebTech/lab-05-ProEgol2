class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_messages, class_name: "Message", foreign_key: :user_id, dependent: :destroy
  has_many :sent_chats, class_name: "Chat", foreign_key: :sender_id, dependent: :destroy
  has_many :received_chats, class_name: "Chat", foreign_key: :receiver_id, dependent: :destroy
  has_many :received_messages, through: :received_chats, source: :messages

  before_save :normalize
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def normalize
      self.first_name = first_name.titleize.strip
      self.last_name = last_name.titleize.strip
      self.email = email.downcase.strip
  end

  def full_name
      "#{first_name} #{last_name}"
  end
end