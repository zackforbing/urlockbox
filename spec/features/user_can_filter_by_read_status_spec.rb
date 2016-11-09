require 'rails_helper'

describe 'User filters links by read status', type: :feature, js: true do
  before(:each) do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    page.set_rack_session({ user_id: user.id })
    link1 = Link.create!(title: 'link1', url: 'http://www.link1.com', user_id: user.id, read: true)
    link2 = Link.create!(title: 'link2', url: 'http://www.link2.com', user_id: user.id)
    link2 = Link.create!(title: 'link3', url: 'http://www.link3.com', user_id: user.id)
  end

  scenario 'User shows all read links' do
    visit root_path

    click_button 'See All Read Links'
    within('#link-table') do
      expect(page).to have_css('tr.link', count: 1)
    end
  end

  scenario 'User shows all unread links' do
    visit root_path

    click_button 'See All Unread Links'
    within('#link-table') do
      expect(page).to have_css('tr.link', count: 2)
    end
  end

  scenario 'User shows all links' do
    visit root_path

    click_button 'See All Unread Links'
    click_button 'Show All Links'
    within('#link-table') do
      expect(page).to have_css('tr.link', count: 3)
    end
  end
end
