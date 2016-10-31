require 'rails_helper'

RSpec.feature 'User can mark Link as read' do
  scenario 'user sees his links and marks one as read' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    page.set_rack_session(user_id: user.id)
    Link.create!(title: 'link', url: 'http://www.link.com', user_id: user.id)

    visit root_path

    expect(page).to have_link('http://www.link.com', href: 'http://www.link.com')

    click_on 'Mark as Read'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Mark as Unread")
  end
end
