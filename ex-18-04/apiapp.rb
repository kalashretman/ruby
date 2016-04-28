require 'sinatra'
require 'sinatra/base'
require 'sinatra/param'
require 'sinatra/json'
require 'mongoid'
require 'dotenv'
require 'sinatra-initializers'
require './models/Image'

Dotenv.load

get '/last_image' do
  "kdhfgkjdhfjk"
end

class Apiapp < Sinatra::Application
  register Sinatra::Initializers
  configure do
    set :raise_sinatra_param_exceptions, true
    set show_exceptions: false
  end

  post '/image' do
    param :url,       String,  required: true
    param :height,    Float,   required: true
    param :width,     Float,   required: true
    param :oper, 	  String,  in: ['resize', 'delete']  #'delete' soon

    last_image = Image.create! params

    json({ image:
      { id: last_image.id.to_s, result: result }
    })
  end

  error Sinatra::Param::InvalidParameterError do
    status 422
    { error: "#{env['sinatra.error'].param} is invalid" }.to_s
  end

  error Mongoid::Errors::DocumentNotFound do
    status 404
    { error: "Not found" }.to_s
  end
end


class String
  def hello
  end
end