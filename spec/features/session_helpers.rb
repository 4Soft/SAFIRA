module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_session_path

      within 'form' do
        fill_in 'user_email', with: email
        fill_in 'user_password', with: password
        click_on 'ENTRAR'
      end
    end

    def sign_in(user)
      visit new_user_session_path
      
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'ENTRAR'
    end
  end
end