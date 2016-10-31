require 'rails_helper'

RSpec.feature 'User can mark Link as read' do
  scenario 'user sees his links and marks one as read' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    page.set_rack_session(user: user.id)

  end
end
