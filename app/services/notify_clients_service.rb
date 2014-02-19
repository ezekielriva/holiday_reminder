class NotifyClientsService

  def holidays(user)
    user.holidays.select do |h|
      DateTime.now <= h.date && DateTime.now >= h.date - 2.day
    end
  end
  
  def notify
    User.all.each do |user|
      holidays = self.holidays(user)
      if !holidays.empty?
        holidays.each do |holiday|
          user.clients.each do |client|
            ClientMailer.reminder_email(client,holiday).deliver!
          end
        end
      end
    end
  end
  
end
