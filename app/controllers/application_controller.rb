class ApplicationController < ActionController::API

  # rescue_from NoMethodError, with: :render_bad_parameters
  #
  # def render_bad_parameters
  #   require "pry"; binding.pry
  #   render json: { status: 400, error: 'Bad request' }
  # end
end
