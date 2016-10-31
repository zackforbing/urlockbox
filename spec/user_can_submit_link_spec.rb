require 'rails_helper'

RSpec.feature 'User can submit a Link' do
  scenario 'on visiting root they are prompted to sign up or login and can do either' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content('Sign Out')
  end
end
