class NytStory
  def initialize(raw_story)
    @raw_story = raw_story
  end

  def title
    raw_story[:title]
  end

  def abstract
    raw_story[:abstract]
  end

  def url
    raw_story[:url]
  end

  def authors
    raw_story[:byline]
  end

  def published_date
    convert_to_readable_time(raw_story[:published_date])
  end

  def thumbnail_url
    raw_story[:multimedia].first[:url]
  end

  def image_url
    raw_story[:multimedia][2][:url]
  end

  private
    attr_reader :raw_story

    def convert_to_readable_time(date)
      split_date = date.split('T').first.split('-')
      "#{split_date[1]}-#{split_date[2]}-#{split_date[0]}"
    end
end
