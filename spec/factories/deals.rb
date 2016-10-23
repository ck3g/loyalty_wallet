FactoryGirl.define do
  factory :deal do
    vendor
    title "Burger of the Month"
    valid_till { 1.day.from_now }
  end
end
