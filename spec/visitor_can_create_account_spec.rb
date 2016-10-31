require 'rails_helper'

RSpec.feature 'Visitor can create an account' do
  scenario 'on visiting root they are prompted to sign up or login' do
    visit root_path

    expect(page).to have_content('Log In or Sign Up')

    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in 'Email', with: 'zackforbing@gmail.com'
    fill_in 'Password', with: 'hithere'
    fill_in 'Confirm Password', with: 'hithere'
    click_button 'Submit'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logged in as zackforbing@gmail.com')
    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Log In or Sign Up')
  end
end
