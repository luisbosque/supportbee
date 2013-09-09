require_relative 'supportbee/client'
require 'json/ext'
require 'openssl'
require 'faraday'
require 'json'

OpenSSL::SSL.send :remove_const, :VERIFY_PEER
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
