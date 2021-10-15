class RelationshipsController < ApplicationController
  def index
    relationships = Relationship.all
    render json: relationships
  end

  def show
    relationship = Relationship.find_by(id: "#{params["id"]}")
    render json: relationship.as_json
  end

  def create
    relationship = Relationship.new(
      requester_id: current_user.id,
      responder_id: params[:responder_id],
      status: "Pending",
    )
    if relationship.save
      render json: relationship
    else
      render json: { errors: relationship.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    relationship = Relationship.find_by(id: "#{params["id"]}")
    relationship.status = params[:status] || relationship.status
    if relationship.save
      render json: relationship
    else
      render json: { errors: relationship.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    relationship = Relationship.find_by(id: "#{params["id"]}")
    relationship.delete
    render json: "relationship destroyed successfully."
  end
end
