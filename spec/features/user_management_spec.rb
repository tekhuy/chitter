require 'spec_helper'

require_relative '../../app/helpers/session'

include SessionHelpers

feature 'A user can ' do
  
  scenario 'register when visiting the site as a new user' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Chitter 2015")
    expect(User.first.email).to eq("test@test.com")
  end

  scenario "not sign up with a password that does not match" do
    expect{ sign_up('test@test.com', 'username', 'pass', 'wrong')}.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "not sign up with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email has already been registered")
  end

  scenario "not sign up with a username that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("The username is unavailable")
  end

end