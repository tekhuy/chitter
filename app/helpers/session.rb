module SessionHelpers

  def sign_up(email = "test@test.com",
              username = 'username',
              password = '123',
              password_confirmation = '123')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Sign up"
  end

end