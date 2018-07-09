class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors.full_messages, status: 422
    end

  end

  def user_params
    params.require(:user).permit([:name, :email])
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def update
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @user.update(user_params)
      render json: @user, status: 201
    else
      render plain: 'User does not exist', status: 404
    end
  end

  def destroy
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @user.destroy
      # render plain: 'User destroyed'
      render json: ['User destroyed:', @user], status: 200
    else
      render plain: 'User does not exist', status: 404
    end
  end
end
