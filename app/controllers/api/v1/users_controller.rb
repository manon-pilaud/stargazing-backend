class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def profile
    token = request.headers['Authentication'].split(' ')[1]
    payload = decode(token)
    @user = User.find(payload["user_id"])
    render json: {user: @user.username,
                  locations: @user.locations,
                  user_locations: @user.user_locations
                 }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
     render json: {
       message: 'created',
       success: true,
       error: false,
       userInfo:{user: @user.username,
         locations: @user.locations,
         user_locations: @user.user_locations
        },
       token: encode({ user_id: @user.id })
     }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    User.find(params[:id]).update(user_params)
    render json: User.find(params[:id])
  end

  def destroy
    render json: User.find(params[:id]).destroy
  end

private
  def user_params
    params.require(:user_params).permit(:username,:user_type,:password)
  end
end
