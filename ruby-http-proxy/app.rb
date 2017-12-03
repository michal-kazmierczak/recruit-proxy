require "./config/initializer"

module RubyHttpProxy
  class Api < Grape::API
    use GrapeLogging::Middleware::RequestLogger, logger: self.logger
    format :json

    desc 'a basic health-check endpoint'
    get '/ping' do
      { message: 'pong' }
    end
  end
end
