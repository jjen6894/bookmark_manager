require 'spec_helper'
# require './app/models/user'

feature 'adding accounts to the website' do
  scenario "user visit's homepage and creates account which relocates them to welcome page" do
    visit '/'
    fill_in "email", with: "Jack@gmail.com"
    fill_in "password", with: "Northall121"
    fill_in "password_confirmation", with: "Northall121"
    click_button("Create account")
    expect(page.current_path).to eq '/links'

  end

  feature 'User sign up' do
    scenario 'I can sign up as a new user' do

      def sign_up
        visit '/'
        fill_in "email", with: "Jack@gmail.com"
        fill_in "password", with: "Northall121"
        fill_in "password_confirmation", with: "Northall121"
        click_button("Create account")
      end

      expect { sign_up }.to change(User, :count).by(1)
      expect(page).to have_content('Jack@gmail.com')
      expect(User.first.email).to eq('Jack@gmail.com')
    end
  end

  feature 'Asks for password confirmation' do
    scenario "I can check to see if my password is entered correctly and stays on the same page and displays an error message" do
        def sign_up
            visit '/'
            fill_in "email", with: "Jack@gmail.com"
            fill_in "password", with: "Northall121"
            fill_in "password_confirmation", with: "NordLord_Nortical"
            click_button("Create account")
        end




      expect { sign_up }.to change(User, :count).by(0)
      expect(page).to have_content("Password and confirmation password do not match")
      expect(page.current_path).to eq('/')
    end
  end

  feature "user can't sign up without entering an email address" do
    scenario "I can't sign up if i leave the email field empty" do
      def sign_up
        visit '/'
        fill_in "password", with: "Northall121"
        fill_in "password_confirmation", with: "Northall121"
        click_button("Create account")
      end

      expect { sign_up }.to change(User, :count).by(0)

      sign_up

      expect(page.current_path).to eq('/')
    end
  end
end
