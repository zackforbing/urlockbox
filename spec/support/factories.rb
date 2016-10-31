FactoryGirl.define do
  # Add individual factories here - https://github.com/thoughtbot/factory_girl
  sequence :url do |n|
    "http://www.#{n}website.com"
  end

  factory :user do
    email "andrew@turing.io"
    password "test"
    password_confirmation "test"
  end

  factory :link do
    title "my link"
    url
  end
end
