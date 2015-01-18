require_relative '../../app/helpers/session'

include SessionHelpers

feature 'User signs out' do
  
  before(:each) do
    User.create(email: "test@test.com",
                username: 'username',
                password: "123",
                password_confirmation: "123")
  end

  scenario 'while being signed in' do
    sign_in('username', '123')
    click_button "Sign out"
    expect(page).to have_content("See you soon!")
    expect(page).not_to have_content("Welcome, username")
  end

end