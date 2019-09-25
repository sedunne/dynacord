module Dynacord
  class Address
    require 'open-uri'

    def initialize(server)
      @server = server
    end

    ## default since it's the only decent minimal public-facing source I know
    def self.get(remote = 'http://ipv4.icanhazip.com')
      begin
        res = open(remote).read
      rescue StandardError => e
        puts "error fetching address: #{e.class} -> #{e.message}"
      end

      res.strip
    end
  end
end
