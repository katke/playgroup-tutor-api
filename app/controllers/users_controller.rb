class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: "#{params["id"]}")
    render json: user.as_json
  end

  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      first_name: params[:first_name],
      location_id: Location.find_by(zipcode: params[:zip_code]).id,
      profile_picture: params[:profile_picture],
      age: params[:age],
      about_me: params[:about_me],
    )

    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by(id: current_user.id)
    user.email = params[:email] || user.email
    user.first_name = params[:first_name] || user.first_name
    user.location_id = Location.find_by(zipcode: params[:zip_code]).id || user.location_id
    user.profile_picture = params[:profile_picture] || user.profile_picture
    user.age = params[:age] || user.age
    user.about_me = params[:about_me] || user.about_me
    
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: "#{params["id"]}")
    user.delete
    render json: "User destroyed successfully."
  end
end
