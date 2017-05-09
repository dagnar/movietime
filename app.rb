require 'sinatra'

class App < Sinatra::Application
	require "sinatra/activerecord"

	require_relative "models/movie"

	set :database, {adapter: "sqlite3", database: "foo.sqlite3"}

  get '/movie' do
  	binding.pry
    response = HTTParty.get('http://www.omdbapi.com/?t=params[:t]')
    response.to_json
  end
end