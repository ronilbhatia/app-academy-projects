class AlbumsController < ApplicationController

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new
    render :new
  end

  def create
    debugger
    @album = Album.new(album_params.except(:band))
    @album.band_id = album_params[:band].to_i
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
    end
  end

  def edit
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params.except(:band))
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
    end
  end

  def destroy
    @album = Band.find(params[:id])
    @band = Band.find(@album.band_id)
    @album.destroy
    redirect_to band_url(@band)
  end
  private

  def album_params
    params.require(:album).permit(:title, :year, :album_type, :band)
  end
end
