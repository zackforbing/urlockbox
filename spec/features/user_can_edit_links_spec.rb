require 'rails_helper'

RSpec.feature 'User can edit Links' do
  scenario 'user fills out edit form successfully' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    page.set_rack_session(user_id: user.id)
    link1 = Link.create!(title: 'link1', url: 'http://www.link1.com', user_id: user.id)
    link2 = Link.create!(title: 'link2', url: 'http://www.link2.com', user_id: user.id)
    link3 = Link.create!(title: 'link3', url: 'http://www.link3.com', user_id: user.id)

    visit root_path

    within("#link_#{link2.id}") do
      click_on 'Edit Link'
    end

    fill_in "Title", with: 'edit link2'
    fill_in "Url", with: 'http://www.editlink2.com'
    click_on 'Submit Edits'

    expect(current_path).to eq(root_path)
    within("#link_#{link2.id}") do
      expect(page).to have_content('edit link2')
      expect(page).to have_link('http://www.editlink2.com', href: 'http://www.editlink2.com')
    end
  end
end
