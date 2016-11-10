class NytCollection < ApplicationRecord
  has_many :stories

  validates :copyright, presence: true
  validates :num_results, presence: true

  def self.upload_top_stories(raw_data)
    collection = create(copyright: raw_data[:copyright],
                        num_results: raw_data[:num_results])
    raw_data[:results].each do |result_data|
      collection.stories << Story.create_from_api_data(result_data)
    end
  end

  def find_stories(search)
    return stories if search.nil?
    stories.where("title LIKE ? OR abstract LIKE ?", "%#{search}%", "%#{search}%")
  end

  def top_five_stories
    stories.first(5)
  end
end
