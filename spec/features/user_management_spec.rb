require 'spec_helper'

require_relative '../../app/helpers/session'

include SessionHelpers

feature 'A user can' do
  
  scenario 'visit the site' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Chitter 2015")
    expect(User.first.email).to eq("test@test.com")
  end

end