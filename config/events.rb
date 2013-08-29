WebsocketRails.setup do |config|

  # Uncomment to override the default log level. The log level can be
  # any of the standard Logger log levels. By default it will mirror the
  # current Rails environment log level.
  # config.log_level = :debug

  # Uncomment to change the default log file path.
  # config.log_path = "#{Rails.root}/log/websocket_rails.log"
  
  # Set to true if you wish to log the internal websocket_rails events
  # such as the keepalive `websocket_rails.ping` event.
  config.log_internal_events = true

  # Change to true to enable standalone server mode
  # Start the standalone server with rake websocket_rails:start_server
  # * Requires Redis
  config.standalone = false

  # Change to true to enable channel synchronization between
  # multiple server instances.
  # * Requires Redis.
  config.synchronize = false

  # Uncomment and edit to point to a different redis instance.
  # Will not be used unless standalone or synchronization mode
  # is enabled.
  # config.redis_options = {:host => 'localhost', :port => '6379'}
end


WebsocketRails::EventMap.describe do
  subscribe :client_connected, to: ChatController, with_method: :client_connected
  subscribe :new_message, to: ChatController, with_method: :new_message
  subscribe :new_user, to: ChatController, with_method: :new_user
  subscribe :change_username, to: ChatController, with_method: :change_username
  subscribe :client_disconnected, to: ChatController, with_method: :delete_user
end
