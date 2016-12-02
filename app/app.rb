ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'pry'
require 'sinatra/flash'



# set :session_secret, 'super secret jack'

class BookmarksManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret jack'
  register Sinatra::Flash

  get '/' do
    erb :'username'
  end


  post '/user_details' do


    user =  User.create(email: params[:email], password: params[:password]) if params[:password] == params[:password_confirmation]
    session[:user_id] = user.id unless user == nil

    if user ==nil || params[:email] == ""
      flash[:notice] = "Password and confirmation password do not match"
      redirect to('/')
    else
      flash[:notice] = "Successfully signed up"
      redirect to('/links')
    end

  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  get '/links' do

    @link = Link.all
    erb :'links/index'
  end



  get '/links/new' do
    erb :'links/new'
  end

  post '/links/create' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(tags: tag)
    end
    link.save


    redirect to('/links')
  end

  get '/tags/:tags' do
    "Filtered by tag: #{params[:tags]}"
    tag = Tag.first(tags: params[:tags])
    @link = tag ? tag.links : []
    erb(:'links/index')
  end

  # # start the server if ruby file executed directly
  run! if app_file == $0
end
