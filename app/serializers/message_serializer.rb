class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :receiver_id, :text, :sender

  def sender
    object.sender
  end
end
