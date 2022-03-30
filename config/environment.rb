require_relative '../lib/simpler'
require_relative '../middleware/http_logger'
require 'byebug'

Simpler.application.bootstrap!
