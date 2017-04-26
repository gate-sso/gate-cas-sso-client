class HomeController < ApplicationController
  before_action :use_unsafe_params, only: [:index]
  before_action RubyCAS::Filter

  def params
    @_dangerous_params || super
  end
  def index
    client = OAuth2::Client.new('localhost-localdomain', 'localhost-development-mode', { site: 'https://cas.example.org:8443', authorize_url: '/cas/oauth2.0/authorize'} )
    @call_back_url = client.auth_code.authorize_url(:redirect_uri => 'http://localhost:8090/o_auth_two/callback')
  end

  def use_unsafe_params
    @_dangerous_params = request.parameters
  end
end
