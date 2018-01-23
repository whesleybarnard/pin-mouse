class PinsController < ApplicationController
  def index
    @pins = PinterestService.retrieve_pins



    # puts response.body, response.code, response.message, response.headers.inspect





    respond_to do |format|
      format.html {render 'index'}
    end
  end
end