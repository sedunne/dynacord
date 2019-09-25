require 'net/http'
require 'json'

module Dynacord
  module Provider
    module Gandi
      class LiveDNS
        def initialize(apikey:)
          @apikey = apikey
          @api = Net::HTTP.new('dns.api.gandi.net', 443)
          @api.use_ssl = true
        end

        ## get the LiveDNS zones and their UUIDs
        def zone_uuids()
          q = Net::HTTP::Get.new('/api/v5/zones')
          q['X-Api-Key'] = @apikey
          r = @api.request(q)
          return r.code, r.body
        end

        ## get the uuid for a given domain
        def uuid_from_domain(domain:)
          zones = zone_uuids()
          uuid = nil
          JSON.parse(zones[1]).each do |zone|
            if zone['name'] == domain
              uuid = zone['uuid']
              break
            end
          end
          return uuid
        end

        ## update a given A record in a provided zone
        def update_record(record:, zone:, ipaddr:, ttl: 300)
          uri = "/api/v5/zones/#{zone}/records/#{record}/A"
          data = {'rrset_ttl' => ttl.to_i, 'rrset_values' => [ipaddr]}.to_json
          q = Net::HTTP::Put.new(uri)
          q['X-Api-Key'] = @apikey
          q["Content-Type"] = "application/json"
          q.body = data
          r = @api.request(q)
          return r.code, r.body
        end
      end
    end
  end
end

    