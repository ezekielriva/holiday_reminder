require "spec_helper"

feature "Clients creation" do
  let!(:user) { create :user }
  let!(:client) { build :client }
  
  scenario "with valid data" do
    login_with user
    visit '/clients/new'
    
    fill_in 'client[name]',       with: client.name
    fill_in 'client[email]',      with: client.email
    
    find_button('Create').click

    expect(user.clients.where(email: client.email)).to exist
  end

  scenario "with invalid data" do
    login_with user
    visit '/clients/new'

    find_button('Create').click

    expect(user.clients).to be_empty
  end
end
