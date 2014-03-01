require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "Srikanth"
    email "a@a.com"
    password "abc123"
    password_confirmation "abc123"
  end
end