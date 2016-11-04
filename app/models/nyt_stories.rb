class NytStories
  def initialize(raw_data)
    @raw_data = raw_data
  end

  def copyright
    raw_data[:copyright]
  end

  def num_results
    raw_data[:num_results]
  end

  def stories(amount = num_results)
    collection = Array.new
    amount.times do |i|
      collection << NytStory.new(raw_data[:results][i])
    end
    collection
  end

  def self.get_top_stories
    service = NytService.new
    NytStories.new(service.top_stories)
  end

  private
    attr_reader :raw_data
end
