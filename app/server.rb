require 'data_mapper'
require 'sinatra/base'
require 'rack-flash'
require_relative '../app/data_mapper_setup'
require_relative '../app/helpers/application'

class Chitter < Sinatra::Base
  set :public_dir, Proc.new{File.join(root, '..', "public")}
  set :public_folder, 'public'

  helpers CurrentUser

  enable :sessions
  use Rack::Flash
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/user/new' do
    @user = User.new
    erb :"user/new"
  end

  post '/user/new' do
    @user = User.create(
                email: params[:email],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation]
                )
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash[:notice] = "Password does not match the confirmation"
      erb :_flash
    end
  end

end