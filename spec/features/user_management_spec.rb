require 'spec_helper'

require_relative '../../app/helpers/session'

include SessionHelpers

feature 'A user can sign up' do
  
  scenario 'when visiting the site as a new user' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Chitter 2015")
    expect(User.first.email).to eq("test@test.com")
  end

end