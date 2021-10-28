class CastInMoviesController < ApplicationController
  before_action :set_cast_in_movie, only: [:show, :update, :destroy]

  # GET /cast_in_movies
  def index
    @cast_in_movies = CastInMovie.all
    render json: @cast_in_movies
  end

  # GET /cast_in_movies/1
  def show
    render json: @cast_in_movie
  end

  # POST /cast_in_movies
  def create
    @cast_in_movie = CastInMovie.new(cast_in_movie_params)

    if @cast_in_movie.save
      render json: @cast_in_movie, status: :created, location: @cast_in_movie
    else
      render json: @cast_in_movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cast_in_movies/1
  def destroy
    @cast_in_movie.destroy
    render json: @cast_in_movie, status: :ok
  end

  def set_cast_in_movie
    @cast_in_movie = CastInMovie.find(params[:id])
  end

  private
    def cast_in_movie_params
      params.require(:cast_in_movie).permit(:character_id, :movie_id)
    end
end
