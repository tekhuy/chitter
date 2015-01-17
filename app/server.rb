require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require_relative '../app/data_mapper_setup'
require_relative '../app/helpers/application'

class Chitter < Sinatra::Base

  helpers CurrentUser

  enable :sessions
  use Rack::Flash
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

end