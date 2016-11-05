desc 'run all NYT API tasks for trending stories'
task nytapitasks: ['nytapitasks:garbage_collection',
                   'nytapitasks:get_stories']

namespace :nytapitasks do
  desc 'import trending stories from NYT into DB'
  task get_stories: :environment do
    service = NytService.new
    NytCollection.upload_top_stories(service.top_stories)
  end

  desc 'clear outdated stories from DB'
  task garbage_collection: :environment do
    unless NytCollection.all.empty?
      NytCollection.all.each { |collection| collection.stories.delete_all }
      NytCollection.delete_all
    end
  end
end
