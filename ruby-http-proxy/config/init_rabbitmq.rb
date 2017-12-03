host = ENV["RABBIT_HOST"] || 'localhost'
port = ENV["RABBIT_PORT"] || 5672
user = ENV["RABBIT_USER"] || 'guest'
password = ENV["RABBIT_PASSWORD"] || 'guest'

$connection = Bunny.new("amqp://#{user}:#{password}@#{host}:#{port}")
sleep 10 # give rabbitmq time to get up
$connection.start
$rabbit_channel = $connection.create_channel
