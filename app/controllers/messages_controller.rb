class MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    messages = Message.all
    render json: messages
  end

  def show
    message = current_user.sent_messages.find_by(id: "#{params[:id]}")
    if message
      render json: message
    else
      render json: "AH ah ah. You didn't say the magic word", status: :unauthorized
    end
  end

  def create
    message = Message.new(
      sender_id: current_user.id,
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
    message = current_user.sent_messages.find_by(id: "#{params[:id]}")
    message.text = params[:text] || message.text
    if message.save
      render json: message
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    message = current_user.sent_messages.find_by(id: "#{params[:id]}")
    message.delete
    render json: "message destroyed successfully."
  end
end
