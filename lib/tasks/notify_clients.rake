namespace :notify do
  desc "Send emails reminder holidays to all clients"
  task :clients => :environment do
    User.all.each do |user|
      holidays = user.holidays.select do |h|
        DateTime.now <= h.date && DateTime.now >= h.date - 2.day
      end
      if !holidays.empty?
        puts "Holidays approaching"
        holidays.each do |holiday|
          user.clients.each do |client|
            ClientMailer.reminder_email(client,holiday).deliver!
          end
        end
      else
        puts "No holidays yet."
      end
    end
  end
end
