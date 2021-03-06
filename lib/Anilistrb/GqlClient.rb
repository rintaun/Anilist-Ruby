require 'httparty'
require 'json'

module Anilistrb
  class GqlClient
    def initialize(url)
      @url = url
    end

    def build_request(query:, variables: nil)
      [ @url, 
        headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' },
        body: { query: query, variables: variables }.to_json ]
    end

    def request(method:, query:, variables: nil)
      # TODO: check if status code not 200
      if method == 'POST'
        HTTParty.post(*build_request(query: query, variables: variables))
      elsif method == 'GET'
        HTTParty.get(*build_request(query: query, variables: variables))
      else                       
        puts "#{method} not supported."
      end
    end
  end
end
