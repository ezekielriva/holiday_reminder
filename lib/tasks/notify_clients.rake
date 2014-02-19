namespace :notify do
  desc "Send emails reminder holidays to all clients"
  task :clients => :environment do
    notifier = NotifyClientsService.new
    notifier.notify
  end
end
