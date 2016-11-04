class NytService
  def initialize
    @api_key = ENV['NYT-API-KEY']
  end

  def top_stories
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :api_key

    def conn
      Faraday.new('https://api.nytimes.com')
    end

    def response
      conn.get "/svc/topstories/v2/national.json?api-key=#{api_key}"
    end
end
