FactoryGirl.define do
  factory :client do
    sequence(:email)      {|n| "client-#{n}@corp.test"}
    sequence(:name)       {|n| "Client-#{n}"}
  end
end
