puts 'Starting up http service...'

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])
