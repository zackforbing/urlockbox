require 'rails_helper'

describe 'User can search links', type: :feature, js: true do
  before(:each) do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    page.set_rack_session({ user_id: user.id })
    link1 = Link.create!(title: 'link1', url: 'http://www.link1.com', user_id: user.id)
    link2 = Link.create!(title: 'link2', url: 'http://www.link2.com', user_id: user.id)
    link2 = Link.create!(title: 'link3', url: 'http://www.link3.com', user_id: user.id)
  end

  scenario 'User searches for link 3' do
    visit root_path

    fill_in "Search Links", with: "link"
    within('#link-table') do
      expect(page).to have_css('tr.link', count: 3)
    end

    fill_in "Search Links", with: "link3"
    within('#link-table') do
      expect(page).to have_css('tr.link', count: 1)
    end
  end

  scenario 'no matching links' do
    visit root_path

    fill_in "Search Links", with: "hi"
    within('#link-table') do
      expect(page).to_not have_css('tr.link')
    end

    fill_in "Search Links", with: "link3"
    within('#link-table') do
      expect(page).to have_css('tr.link', count: 1)
    end
  end
end
