require 'spec_helper'
# require './app/models/user'

feature 'adding accounts to the website' do
  scenario "user visit's homepage and creates account which relocates them to welcome page" do
    visit '/'
    fill_in "Username", with: "Jack"
    fill_in "Password", with: "Northall121"
    click_button("Create account")
    expect(page.current_path).to eq '/links'

  end
  scenario "username is displayed in the welcome page " do
    visit '/'
    fill_in "Username", with: "Jack"
    fill_in "Password", with: "Northall121"
    click_button("Create account")
    expect(page).to have_content("Jack")
  end

  scenario "user created - user count increases by one" do
  User.count = 0
  visit '/'
  fill_in "Username", with: "Jack"
  fill_in "Password", with: "Northall121"
  click_button("Create account")
  expect(User.count).to change_by(1)
  end


end
