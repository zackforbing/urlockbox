require 'rails_helper'

describe 'User can search links', type: :feature, js: true do
  before(:each) do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    page.set_rack_session({ user_id: user.id })
  end

  context 'unread link' do
    scenario 'user can mark the link as read' do
      link1 = Link.create!(title: 'link1', url: 'http://www.link1.com', user_id: user.id)

      visit root_path

      click_on 'Mark as Read'

      within('.link') do
        expect(page).to have_content('Mark as Unread')
      end
    end
  end

  context 'read link' do
    scenario 'user can mark the link as unread' do
      link1 = Link.create!(title: 'link1', url: 'http://www.link1.com', user_id: user.id, read: true)

      visit root_path

      click_on 'Mark as Unread'

      within('.link') do
        expect(page).to have_content('Mark as Read')
      end
    end
  end
end
