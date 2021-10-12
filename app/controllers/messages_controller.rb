class MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages
  end

  def show
    message = Message.find_by(id: "#{params["id"]}")
    render json: message.as_json
  end

  def create
    message = Message.new(
      sender_id: params[:sender_id],
      receiver_id: params[:receiver_id],
      text: params[:text],
    )
    if message.save
      render json: message
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    message = Message.find_by(id: "#{params["id"]}")
    message.text = params[:text] || message.text
    if message.save
      render json: message
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    message = Message.find_by(id: "#{params["id"]}")
    message.delete
    render json: "message destroyed successfully."
  end
end
