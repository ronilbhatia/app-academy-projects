class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(params.require(:band).permit(:name))
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(params.require(:band).permit(:name))
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
    end
  end

  def destroy
    @band = Band.find(params[:id])
    # debugger
    @band.destroy
    redirect_to bands_url
  end
end
