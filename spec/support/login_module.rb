module LoginModule
  def login(user)
    visit user_session_path
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: 'password'
    click_button 'Log in'
  end
end
