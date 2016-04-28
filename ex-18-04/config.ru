require './apiapp'
require 'rack/contrib'

use Rack::PostBodyContentTypeParser

run Apiapp