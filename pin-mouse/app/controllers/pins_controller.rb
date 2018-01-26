class PinsController < ApplicationController
  def index
    @pins = PinterestService.retrieve_pins
    
    respond_to do |format|
      format.html {render 'index'}
    end
  end

  def root_json
    render json: { root: true }
  end
end