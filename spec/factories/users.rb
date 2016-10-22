FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password "password"
    confirmed_at { 1.minute.ago }

    factory :user_example_com do
      email "user@example.com"
    end
  end

  factory :vendor_user, class: "VendorUser" do
    sequence(:email) { |n| "vendor-#{n}@example.com" }
    password "password"
    type "VendorUser"
  end
end
