class UsersController < ApplicationController
  def index
    render plain: "I am the users' index"
  end

  def create
    render json: params
  end

  def show
    render json: params
  end

  def update
    render json: params
  end

  def destroy
    render json: params
  end
end
