class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :receiver_id, :text, :sender, :created_at, :updated_at

  def sender
    object.sender
  end
end
