class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    render json: @artworks, status: 200
  end

  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork, status: 200
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork, status: 201
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      render json: @artwork, status: 201
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    if @artwork.destroy(artwork_params)
      render json: @artwork, status: 201
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def artwork_params
    params.require(:artwork).permit([:title, :image_url, :artist_id])
  end
end
