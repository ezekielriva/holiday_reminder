FactoryGirl.define do
  factory :holiday do
    sequence(:name)       {|n| "Holiday-#{n}"}
    sequence(:date)       {|n| DateTime.new(1990,12,12) }
  end
end
