require 'rails_helper'

RSpec.feature 'User can submit a Link' do
  scenario 'on visiting root they are prompted to sign up or login and can do either' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in 'Title', with: 'test'
    fill_in 'Url', with: 'http://www.google.com'
    click_on 'Add Link'
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content('test')
    expect(page).to have_link('http://www.google.com', href: 'http://www.google.com')
    expect(page).to have_content('false')
  end
end
