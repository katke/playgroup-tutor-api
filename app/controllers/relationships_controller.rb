class RelationshipsController < ApplicationController
  before_action :authenticate_user

  def index
    relationships = Relationship.all
    render json: relationships
  end

  def requests
    requests = Relationship.where({ status: "Pending", responder_id: current_user.id })
    render json: requests
  end

  def friendships
    friendships = Relationship.where({ status: "Accepted", responder_id: current_user.id }).or(Relationship.where({ status: "Accepted", requester_id: current_user.id }))
    render json: friendships
  end

  def friends
    friendships = Relationship.where({ status: "Accepted", responder_id: current_user.id }).or(Relationship.where({ status: "Accepted", requester_id: current_user.id }))
    friends = []
    friendships.each { |friendship|
      unless friendship.responder_id == current_user.id
        friends << friendship.responder
      end
      unless friendship.requester_id == current_user.id
        friends << friendship.requester
      end
    }

    render json: friends
  end

  def show
    relationship = Relationship.find_by(id: "#{params["id"]}")
    render json: relationship
  end

  def create
    my_request = Relationship.find_by(responder_id: "#{params[:responder_id]}", requester_id: "#{current_user.id}")
    their_request = Relationship.find_by(responder_id: "#{current_user.id}", requester_id: "#{params[:responder_id]}")

    if my_request == nil
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
    elsif my_request.status == "Pending"
      render json: { errors: "You have already friend-requested this person" }, status: :unprocessable_entity
    elsif my_request.status == "Accepted" || their_request.status == "Accepted"
      render json: { errors: "You are already friends" }, status: :unprocessable_entity
    end
  end

  def update
    relationship = Relationship.find_by(id: params[:id])
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
