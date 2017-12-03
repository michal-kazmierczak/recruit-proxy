require "./config/initializer"

module RubyHttpProxy
  class Api < Grape::API
    use GrapeLogging::Middleware::RequestLogger, logger: self.logger
    format :json

    desc 'returns a collection of clients'
    get '/clients' do
      RabbitRPCClient.new(queue: 'backend.clients', payload: {}).call
    end

    desc 'returns a collection of invoices, features filtering eg. /invoices?client_id=google'
    params do
      optional :client_id, type: String
    end
    get '/invoices' do
      client_id = params[:client_id]
      RabbitRPCClient.new(
        queue: 'backend.invoices',
        payload: client_id ? { client_id: client_id } : {}
      ).call
    end

    desc 'a basic health-check endpoint'
    get '/ping' do
      { message: 'pong' }
    end
  end
end
