class Story < ApplicationRecord
  belongs_to :nyt_collection
  has_many :pitches

  validates :title, presence: true
  validates :abstract, presence: true
  validates :url, presence: true
  validates :authors, presence: true
  validates :raw_published_date, presence: true

  def self.create_from_api_data(raw_data)
    new_story = create(title:               raw_data[:title],
                        abstract:           raw_data[:abstract],
                        url:                raw_data[:url],
                        authors:            raw_data[:byline],
                        raw_published_date: raw_data[:published_date])
    unless raw_data[:multimedia].empty?
      new_story.set_multimedia(raw_data[:multimedia])
    end
    new_story
  end

  def published_date
    convert_to_readable_time(raw_published_date)
  end

  def elapsed_time_since_published
    calculate_elapsed_time(raw_published_date)
  end

  def set_multimedia(data)
    update(thumbnail_url:  data.first[:url],
           image_url:      data[2][:url])
  end

  private
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
