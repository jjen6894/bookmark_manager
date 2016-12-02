require 'spec_helper'
# require './app/models/user'

feature 'adding accounts to the website' do
  scenario "user visit's homepage and creates account which relocates them to welcome page" do
    visit '/'
    fill_in "email", with: "Jack"
    fill_in "password", with: "Northall121"
    fill_in "password_confirmation", with: "Northall121"
    click_button("Create account")
    expect(page.current_path).to eq '/links'

  end

  feature 'User sign up' do
    scenario 'I can sign up as a new user' do

      def sign_up
        visit '/'
        fill_in "email", with: "Jack"
        fill_in "password", with: "Northall121"
        fill_in "password_confirmation", with: "Northall121"
        click_button("Create account")
      end

      expect { sign_up }.to change(User, :count).by(1)
      expect(page).to have_content('Jack')
      expect(User.first.email).to eq('Jack')
    end
  end

  feature 'Asks for password confirmation' do
    scenario "I can check to see if my password is correctly" do
        def sign_up
            visit '/'
            fill_in "email", with: "Jack"
            fill_in "password", with: "Northall121"
            fill_in "password_confirmation", with: "NordLord_Nortical"
            click_button("Create account")
        end




      expect { sign_up }.to change(User, :count).by(0)
    end
  end


end
