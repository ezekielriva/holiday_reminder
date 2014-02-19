require "spec_helper"

describe NotifyClientsService, type: :feature do
  before(:each) do
    @user = create(:user)
    @nearby = create(:nearby_holiday)
    @user.holidays = [create(:holiday), @nearby]
    @user.clients = [create(:client)]
    @service = NotifyClientsService.new
  end

  describe "holidays" do
    it { expect( @service.holidays(@user) ).not_to be_empty  }
    
    it "when not exist nearby holiday" do
      @user.holidays = [@user.holidays.first]
      expect( @service.holidays(@user) ).to be_empty
    end
  end

  describe "notify" do
    before(:each) do
      @service.notify
      @client = @user.clients.first
      open_email(@client.email)
    end
    
    it { expect(current_email).to have_content @client.name }
    it { expect(current_email).to have_content @nearby.name }
    it { expect(current_email).to have_content @nearby.date }
  end
end
