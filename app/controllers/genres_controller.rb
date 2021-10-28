class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :update, :destroy]

  GenreReducer = Rack::Reducer.new(
    Genre.all,
    ->(name:)   {where('lower(name) like ?', "%#{name.downcase}%")},
    ->(movies:) {joins(:movies).where({"movies.id" => movies})},
    ->(order:)  {reorder(order)}
  )

  # GET /genres
  def index
    @genres = GenreReducer.apply(request.query_parameters)

    render json: @genres
  end

  # GET /genres/1
  def show
    render json: @genre, serializer: GenreDetailSerializer
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      render json: @genre, status: :created, location: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  def update
    if @genre.update(genre_params)
      render json: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  def destroy
    @genre.destroy
    
    render json: @genre, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:name, :image)
    end
end
