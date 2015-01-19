module SessionHelpers

 # def sign_in(email, password)
 #    visit '/sessions/new'
 #    fill_in :email, with: email
 #    fill_in :password, with: password
 #    click_button 'Sign in'
 #  end

  def sign_up(
              email = 'test@test.com', 
              username = 'username',
              password = '123',
              password_confirmation = '123')
    visit '/user/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Sign up"
  end

  # def reset_password(email = 'test@test.com')
  #   sign_up
  #   visit '/user/forgot_password'
  #   fill_in :email, with: 'test@test.com'
  #   click_button "Reset password"
  # end

  # def fill_in_new_password_fields(
  #             email = 'test@test.com', 
  #             new_password = 'abc',
  #             new_password_confirmation = 'abc')  
  #   fill_in :email, with: email
  #   fill_in :new_password, with: new_password
  #   fill_in :new_password_confirmation, with: new_password_confirmation
  #   click_button "Reset password"
  # end 

end