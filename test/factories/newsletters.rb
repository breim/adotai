# frozen_string_literal: true

FactoryBot.define do
  factory :newsletter do
    name { 'MyString' }
    email { 'MyString' }
    token { 'MyString' }
    active { false }
    provider { 'MyString' }
    signup_date { '2019-07-24' }
  end
end
