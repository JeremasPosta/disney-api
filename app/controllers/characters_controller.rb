class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  # GET /characters
  def index
    search_param = params.dup
    search_param.delete('controller')
    search_param.delete('action')
    
    if search_param.blank?
      @characters = Character.select(:id, :name, :image)
    end
    @characters ||= Character.where(["name = :name OR id = :id OR age = :age OR weight = :weight", name: params[:name], id: params[:id], age: params[:age], weight: params[:weight]])
  

    render json: @characters
  end

  # GET /characters/1
  def show
    render json: @character
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
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      #  params.permit(:image, :name, :age, :weight, :history, :filmography)                  #This works, 
      params.require(:character).permit(:image, :name, :age, :weight, :history) #But this work better
    end
end
