require 'rails_helper'

RSpec.feature 'User can mark Link as read' do
  scenario 'user sees his links and marks one as read' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    page.set_rack_session(user_id: user.id)
    link1 = Link.create!(title: 'link1', url: 'http://www.link1.com', user_id: user.id)
    link2 = Link.create!(title: 'link2', url: 'http://www.link2.com', user_id: user.id)
    link3 = Link.create!(title: 'link3', url: 'http://www.link3.com', user_id: user.id)

    visit root_path

    expect(page).to have_link('http://www.link1.com', href: 'http://www.link1.com')
    expect(page).to have_link('http://www.link2.com', href: 'http://www.link2.com')
    expect(page).to have_link('http://www.link3.com', href: 'http://www.link3.com')
  
    within("#link_#{link1.id}") do
      click_on 'Mark as Read'
    end

    expect(current_path).to eq(root_path)
    within("#link_#{link1.id}") do
      expect(page).to have_content("Mark as Unread")
    end
    within("#link_#{link2.id}") do
      expect(page).to have_content("Mark as Read")
    end
    within("#link_#{link3.id}") do
      expect(page).to have_content("Mark as Read")
    end
  end
end
