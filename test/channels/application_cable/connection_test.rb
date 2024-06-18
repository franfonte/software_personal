# frozen_string_literal: true

require 'test_helper'

module ApplicationCable
  class ConnectionTest < ActionCable::Connection::TestCase
    def setup
      @channel = ApplicationCable::Channel.new(connection, {})  # Aquí puedes inicializar tu canal según sea necesario
    end
    
    test "subscribes to channel" do
      subscribe
  
      assert subscription.confirmed?
      assert_has_stream_for "channel_stream_name"
    end
    
    test "unsubscribes from channel" do
      subscribe
  
      unsubscribe
  
      assert subscription.rejected?
    end
  end
end
