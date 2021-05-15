class CharactersController < ApplicationController
  def index
      @characters = Character.all 
      render json: @characters
  end 

  def show
      @character = Character.find(params[:id])
      render json: @character
  end 

  def create
      @character = Character.create(
          image: params[:image],
          name: params[:name],
          age: params[:age],
          weight: params[:weight],
          history: params[:history],
          filmography: params[:filmography]
      )
      render json: @character
  end 

  def update
      @character = Character.find(params[:id])
      @character.update(
        image: params[:image],
        name: params[:name],
        age: params[:age],
        weight: params[:weight],
        history: params[:history],
        filmography: params[:filmography]
      )
      render json: @character
  end 

  def destroy
      @characters = Character.all 
      @character = Character.find(params[:id])
      @character.destroy
      render json: @characters
  end 
    
end
