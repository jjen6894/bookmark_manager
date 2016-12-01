ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'pry'



class BookmarksManager < Sinatra::Base



  get '/links' do
    @link = Link.all
    erb :'links/index'
  end



  get '/links/new' do
    erb :'links/new'
  end

  post '/links/create' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(tags: params[:tags])
    link.tags << tag
    p link.tags
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
