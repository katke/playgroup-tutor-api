class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :favoriteformats

  has_many :requested_relationships, class_name: "Relationship", foreign_key: "requester_id"
  has_many :responded_relationships, class_name: "Relationship", foreign_key: "responder_id"

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"

  belongs_to :location
end
