class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :index]

  def index
    users = User.includes(:favoriteformats).all
    render json: users
  end

  def show
    user = User.includes(:favoriteformats).find_by(id: "#{params["id"]}")
    render json: user
  end

  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      first_name: params[:first_name],
      zipcode: params[:zipcode],
      profile_picture: params[:profile_picture],
      age: params[:age],
      about_me: params[:about_me],
    )

    #check if the location exists, if it does- assign the lat/long. Otherwise set to nil
    zipcodes = eval(File.read("./db/zips.rb"))

    if zipcodes[params[:zipcode]]
      user[:latitude] = zipcodes[params[:zipcode]][:latitude]
      user[:longitude] = zipcodes[params[:zipcode]][:longitude]
    else
      user[:zipcode] = nil
    end

    #if the zipcode is bad, this workaround sends the error long with the rest of the errors"
    if user.save
      render json: user
    else
      user.errors.add :base, "ZIP code must be a valid 5 digit entry"
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by(id: current_user.id)
    user.email = params[:email] || user.email
    user.first_name = params[:first_name] || user.first_name
    user.zipcode = params[:zipcode] || user.zipcode
    user.profile_picture = params[:profile_picture] || user.profile_picture
    user.age = params[:age] || user.age
    user.about_me = params[:about_me] || user.about_me

    #check if the location exists, if it does- assign the lat/long. Otherwise set to nil
    if params[:zipcode]
      zipcodes = eval(File.read("./db/zips.rb"))
      if zipcodes[params[:zipcode]]
        user[:latitude] = zipcodes[params[:zipcode]][:latitude]
        user[:longitude] = zipcodes[params[:zipcode]][:longitude]
      else
        user[:zipcode] = nil
      end
    end

    #if the zipcode is bad, this workaround sends the error long with the rest of the errors"
    if user.save
      render json: user
    else
      user.errors.add :base, "ZIP code must be a valid 5 digit entry"
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: "#{params["id"]}")
    user.delete
    render json: "User destroyed successfully."
  end
end
