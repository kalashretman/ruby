require 'sinatra/base'
require 'sinatra/param'
require 'sinatra/json'
require 'mongoid'
require 'dotenv'
require 'sinatra-initializers'
require './models/calculation'

Dotenv.load

class Lesson < Sinatra::Application
  register Sinatra::Initializers
  configure do
    set :raise_sinatra_param_exceptions, true
    set show_exceptions: false
  end

  get '/last_calculation' do
    calculation = Calculation.find params['id']
    json({ calculation:
      { id: calculation.id.to_s, result: calculation.result }
    })
  end

  post '/calculation' do
    param :param1,    Float,  required: true
    param :param2,    Float,  required: true
    param :operation, String, in: ['plus', 'minus']

    result = params['param1'] + params['param2']

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