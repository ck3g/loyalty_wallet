FactoryGirl.define do
  factory :vendor do
    user factory: :vendor_user
    name "Cozy Little Cafe"
  end
end
