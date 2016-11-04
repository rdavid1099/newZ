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

  def elapsed_time_since_published
    calculate_elapsed_time(raw_story[:published_date])
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

    def calculate_elapsed_time(date)
      split_date = date.split(/[\-\:T]/)
      seconds = Time.now - convert_to_time(split_date)
      (seconds / 60 / 60).to_i
    end

    def convert_to_time(split_date)
      Time.new(
        split_date[0],
        split_date[1],
        split_date[2],
        split_date[3],
        split_date[4],
        split_date[5],
        "-04:00"
        )
    end
end
