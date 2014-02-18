require "spec_helper"

feature "Holiday creation" do
  let!(:user) { create :user }
  let!(:holiday) { build :holiday }

  scenario "with valid data" do
    login_with user
    visit '/holidays/new'

    fill_in 'holiday[name]',      with: holiday.name
    fill_in 'holiday[date]',      with: holiday.date

    find_button('Create').click

    expect(user.holidays.where(date: holiday.date)).to exist
  end

  scenario "with invalid data" do
    login_with user
    visit '/holidays/new'

    find_button('Create').click

    expect(user.holidays).to be_empty
  end
end
