require 'sinatra/base'
require 'oauth2'

class Application < Sinatra::Base
  enable :sessions
  
  OAUTH_PROVIDER_URL = 'http://localhost:3000'
  OAUTH_CALLBACK_URL = 'http://localhost:9393/oauth/callback'
  
  def client
    @client ||= OAuth2::Client.new '120094574673767', 'b54dc82476af2814e620b86776c42c0e', {
      :site => OAUTH_PROVIDER_URL,
      :access_token_method => :post,
      :authorize_url => '/oauth2/authorize',
      :token_url     => '/oauth2/token',
      :adapter => :NetHttp,
    }
  end
  
  get '/oauth/start' do
    redirect client.auth_code.authorize_url
  end
  
  get '/oauth/password' do
    begin
      access_token = client.password.get_token "alex@fuckingawesome.com", "dragons"
      access_token.get('/me').body
    rescue OAuth2::Error => e
      e.description
    end
  end
  
  get '/oauth/callback' do
    begin
      # TODO: Save access_token for future usage (15 min lifetime)
      access_token = client.auth_code.get_token params[:code], :redirect_uri => OAUTH_CALLBACK_URL
      access_token.get('/me').body
    rescue OAuth2::Error => e
      e.description
    end
  end
end