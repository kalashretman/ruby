require 'sinatra'
require 'sinatra/json'
require_relative 'calc.rb'

get '/calculate' do

	a = params['param1'] 
  	b = params['operation'] 
  	oper = params['param2']

  	puts a
  	calculate = Calc.new a, b, oper
  	result = calculate.get_result()

  	json({ calculation: { result: result } })
end

not_found do
    status 404
    	"Upss! Something wrong! Try again."
end