class ScreenShowsController < ApplicationController
  before_action :set_screen_show, only: [:show, :update, :destroy]

  # GET /screen_shows
  def index
    @screen_shows = ScreenShow.all

    render json: @screen_shows
  end

  # GET /screen_shows/1
  def show
    render json: @screen_show
  end

  # POST /screen_shows
  def create
    @screen_show = ScreenShow.new(screen_show_params)

    if @screen_show.save
      render json: @screen_show, status: :created, location: @screen_show
    else
      render json: @screen_show.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /screen_shows/1
  def update
    if @screen_show.update(screen_show_params)
      render json: @screen_show
    else
      render json: @screen_show.errors, status: :unprocessable_entity
    end
  end

  # DELETE /screen_shows/1
  def destroy
    @screen_show.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screen_show
      @screen_show = ScreenShow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def screen_show_params
      params.require(:screen_show).permit(:title, :image, :qualification, :realese, :cast_characters)
    end
end
