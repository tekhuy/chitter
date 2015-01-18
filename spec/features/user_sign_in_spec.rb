require_relative '../../app/helpers/session'

include SessionHelpers

feature "User signs in" do 
  
  before(:each) do
    User.create(email: "test@test.com", username: 'username', password: '123', password_confirmation: '123')
  end

  scenario "with correct details" do
    visit '/'
    expect(page).not_to have_content("Welcome, username")
    sign_in('username', '123')
    expect(page).to have_content("Welcome, username")
  end

  scenario "with incorrect details" do
    visit '/'
    expect(page).not_to have_content("Welcome, username")
    sign_in('username', 'wrong')
    expect(page).not_to have_content("Welcome, username")
  end

end