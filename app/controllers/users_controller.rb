class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: {
      user: User.find(params[:id])
    }
  end

  def create
    render json: User.create(user_params)
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
    params.require(:user_params).permit(:name,:user_type)
  end
end
