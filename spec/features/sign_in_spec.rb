require 'rails_helper'
 
feature 'User signs in' do
    given!(:user) { FactoryBot.create(:my_user) }

    scenario 'with valid credentials' do
        visit '/my_users/sign_in'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        check 'Remember me'
        click_button 'Log in'
        expect(page).to have_content "Welcome To Home Page"
    end
end
