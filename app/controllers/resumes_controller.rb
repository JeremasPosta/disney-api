class ResumesController < ApplicationController
  skip_before_action :authenticate_request
  def index
    render "index"
  end
end
