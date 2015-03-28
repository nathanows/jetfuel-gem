require "httparty"

module Jetfuel
  class URL
    include HTTParty
    attr_reader :api

    base_uri 'http://api.lvh.me:3000/'

    def self.shorten(long_url)
      response = post('/api/v1/url.json', body: { url: { long: long_url } })
      response["url"]["short_url"]
    end

    def self.all(sort_order: "updated_at", page: "1")
      response = get("/api/v1/url.json", body: { sort_order: sort_order,
                                                 page: page })
      response["url"]
    end
  end
end
