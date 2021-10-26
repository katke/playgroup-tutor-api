class RelationshipSerializer < ActiveModel::Serializer
  attributes :id, :requester_id, :responder_id, :status, :created_at, :updated_at

  belongs_to :requester, class_name: "User"
  belongs_to :responder, class_name: "User"
end
