class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  CharacterReducer = Rack::Reducer.new(
    Character.all,
    ->(name:)   {where('lower(name) like ?', "%#{name.downcase}%")},
    ->(age:)    {where(age: age)},
    ->(movies:)    {joins(:movies).where({"cast_in_movies.movie_id" => movies})},
    ->(weight:) {where(weight: weight)},
    ->(order:)  {reorder(order)}
  )

  # GET /characters
  def index
    @characters = CharacterReducer.apply(request.query_parameters)
    render json: @characters, each_serializer: CharacterSerializer
  end

  # GET /characters/1
  def show
    render json: @character, serializer: CharacterDetailSerializer
  end

  # POST /characters
  def create
    @character = Character.new(character_params)

    if @character.save
      render json: @character, status: :created, location: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  def update
    if @character.update(character_params)
      render json: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  def destroy
    @character.destroy
    render json: @character, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:image, :name, :age, :weight, :history)
    end
end
