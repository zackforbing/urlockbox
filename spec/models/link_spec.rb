require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should belong_to(:user) }

  it 'validates urls' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    link = Link.new(title: 'the goog', url: 'http://www.google.com', user: user)
    
    expect(link.valid?).to eq(true)
  end

  it 'does not validate improperly formatted urls' do
    user = User.create!(email: 'andrew@turing.io', password: 'test', password_confirmation: 'test')
    link = Link.new(title: 'the goog', url: 'google.com', user: user)

    expect(link.valid?).to eq(false)
  end
end
