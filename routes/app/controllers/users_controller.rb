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


  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def update
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      modify_user(:update)
    else
      render plain: 'User does not exist', status: 404
    end
  end

  def destroy
    if User.exists?(params[:id])
      @user = User.find(params[:id])

      if @user.destroy
       render json: ["destroy successful", @user], status: 201
      else
       render json: @user.errors.full_messages, status: 422
      end

    else
      render plain: 'User does not exist', status: 404
    end
  end
end

private

def user_params
  params.require(:user).permit([:username])
end

def modify_user(mod)
  if @user.send(mod, user_params)
   render json: ["#{mod} successful", @user], status: 201
  else
   render json: @user.errors.full_messages, status: 422
  end
end
