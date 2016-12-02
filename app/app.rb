ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'pry'

# set :session_secret, 'super secret jack'

class BookmarksManager < Sinatra::Base

  enable :sessions

  get '/' do
    erb :'username'
    session[:current_user] = params[:Username]
  end

  get '/links' do
    session[:current_user]
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
