class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  MovieReducer = Rack::Reducer.new(
    Movie.all,
    ->(title:)   {where('lower(title) like ?', "%#{title.downcase}%")},
    ->(realese:) {where(realese: realese)},
    ->(genre:)    {joins(:genre).where({"genre.id" => genre})},
    ->(order:)  {reorder(order)}
  )

  # GET /movies
  def index
    @movies = MovieReducer.apply(request.query_parameters)
    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie, serializer: MovieDetailSerializer
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
    render json: @movie, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :image, :qualification, :realese, :genre_id)
    end
end
