class Api::V1::DiscogsController < ApplicationController
  def index
    # @album = DiscogsService.get_album(params[:album])
    @album = DiscogsService.get_album_data(params[:album])
    # require "pry"; binding.pry
  end
end
