require 'rake'

namespace :order do
  desc 'Updates orders and apartments statuses due to date'
  task status_updater: :environment do
    StatusesUpdateWorker.perform
  end
end
