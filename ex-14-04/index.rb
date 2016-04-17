require 'sinatra'
#require 'sinatra/param'
#require 'sinatra/json'

#set :raise_sinatra_param_exceptions, true
#set :show_exceptions, false

get '/calculate' do
  param :param1,    Float,  required: true
  param :param2,    Float,  required: true
  param :operation, String, in: ['plus', 'minus']

  result = params['param1'] + params['param2']

  json({ calculation: { result: result } })
end

#error Sinatra::Param::InvalidParameterError do
#  status 422
#  { error: "#{env['sinatra.error'].param} is invalid" }.to_s
#end
#calculate?param1=12&param2=321&operation=plus