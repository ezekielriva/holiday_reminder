require "spec_helper"
require "rake"

describe "notify rake task" do
  before :all do
    Rake.application.rake_require "tasks/notify_clients"
    Rake::Task.define_task(:environment)
  end

  describe "notify:clients" do
    before do
      @user = create :user
      @user.clients = [create(:client)]
      @user.holidays = [create(:holiday), create(:nearby_holiday)]
    end

    let :run_rake_task do
      Rake::Task['notify:clients'].reenable
      Rake.application.invoke_task "notify:clients"
    end

    it { expect(subject).not_to raise_exception }

    it "should send emails" do
      open_email(@user.clients.first)
    end

  end
end
