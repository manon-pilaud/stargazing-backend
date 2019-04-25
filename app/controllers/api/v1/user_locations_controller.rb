class Api::V1::UserLocationsController < ApplicationController
  def index
    render json: UserLocation.all
  end

  def show
    render json: {
      user_location: UserLocation.find(params[:id])
    }
  end


  def create
    token = request.headers['Authentication'].split(' ')[1]
    user_id = decode(token)["user_id"]
    @user_location = UserLocation.new(
                location_id: params[:location_id],
                user_id: user_id,
                )
    if @user_location.valid?
        @user_location.save
        render json: @user_location, status: :accepted
    end
  end

  def update
    UserLocation.find(params[:id]).update(user_location_params)
    render json: UserLocation.find(params[:id])
  end

  def destroy
    render json: UserLocation.find(params[:id]).destroy
  end

private
  def user_location_params
    params.require(:user_location).permit(:location_id,:user_id)
  end
end
