class RabbitRPCClient
  def initialize(queue:, payload:)
    channel = $rabbit_channel
    @queue = queue
    @payload = payload

    @exchange = channel.default_exchange
    @call_id = "#{rand}#{rand}#{rand}" # much uniq
    @reply_queue = channel.queue('', exclusive: true)
  end

  def call
    subscribe_reply_queue
    send_message

    lock.synchronize{condition.wait(lock)}

    begin
      JSON(response)
    rescue JSON::ParserError
      'the backend replied with malformed JSON'
    end
  end

  private

  attr_accessor :response, :call_id, :exchange, :reply_queue,
                :queue, :lock, :condition, :payload

  def subscribe_reply_queue
    @lock = Mutex.new
    @condition = ConditionVariable.new

    reply_queue.subscribe do |_, properties, response_payload|
      if properties[:correlation_id] == call_id
        @response = response_payload
        lock.synchronize{condition.signal}
      end
    end
  end

  def send_message
    exchange.publish(
      payload.to_json,
      routing_key: queue,
      correlation_id: call_id,
      reply_to: reply_queue.name
    )
  end
end
