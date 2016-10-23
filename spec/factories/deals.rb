FactoryGirl.define do
  factory :deal do
    vendor
    title "Burger of the Month"
    valid_from { DateTime.current }
    valid_till { 1.day.from_now }
  end
end
