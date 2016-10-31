require 'rails_helper'

RSpec.feature 'Visitor can create an account' do
  scenario 'on visiting root they are prompted to sign up or login' do
    visit root_path

    expect(page).to have_content('Log In or Sign Up')

    fill_in 'Email', with: 'zackforbing@gmail.com'
    fill_in 'Password', with: 'hithere'
    click_button 'Submit'
  end
end
