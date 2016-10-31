require 'rails_helper'

RSpec.feature 'User can submit a Link' do
  scenario 'on visiting root they are prompted to sign up or login and can do either' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in 'Title', with: 'test'
    fill_in 'Url', with: 'http://www.google.com'
    click_on 'Add Link'
    require "pry"; binding.pry
    save_and_open_page
    expect(current_path).to eq(root_path)
    expect(page).to have_link('test', href: 'http://www.google.com')
  end
end
