require 'rails_helper'

RSpec.feature 'User can mark Link as read' do
  scenario 'user sees his links and marks one as read' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    page.set_rack_session(user_id: user.id)
    link1 = Link.create!(title: 'link1', url: 'http://www.link1.com', user_id: user.id)
    link2 = Link.create!(title: 'link2', url: 'http://www.link2.com', user_id: user.id)
    link3 = Link.create!(title: 'link3', url: 'http://www.link3.com', user_id: user.id)

    visit root_path

    
  end
end
