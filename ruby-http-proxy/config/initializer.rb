puts 'Starting up http service...'

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])
require './config/init_rabbitmq'
require './src/rabbit_rpc_client'
