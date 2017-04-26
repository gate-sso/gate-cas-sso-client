class HomeController < ApplicationController
  before_action :use_unsafe_params, only: [:index]
  before_action RubyCAS::Filter

  def params
    @_dangerous_params || super
  end
  def index

  end

  def use_unsafe_params
    @_dangerous_params = request.parameters
  end
end
