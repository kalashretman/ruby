require 'sinatra/base'
require 'sinatra/param'
require 'sinatra/json'
require 'mongoid'
require 'dotenv'
require 'sinatra-initializers'
require './models/Image'

Dotenv.load

class Lesson < Sinatra::Application
  register Sinatra::Initializers
  configure do
    set :raise_sinatra_param_exceptions, true
    set show_exceptions: false
  end

  get '/last_image' do
    calculation = Image.find params['id']
    json({ your_image:
      { id: calculation.id.to_s, result: calculation.result }
    })
  end

  post '/image' do
    param :url,       String,  required: true
    param :height,    Float,   required: true
    param :width,     Float,   required: true
    param :oper, 	  String,  in: ['resize', 'delete']  #'delete' soon

    
    calculation_params = params.merge({ 'result' => result })
    calculation = Calculation.create! calculation_params

    json({ calculation:
      { id: calculation.id.to_s, result: result }
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