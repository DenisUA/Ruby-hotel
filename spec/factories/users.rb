FactoryGirl.define do
  factory :user do
    first_name 'Tony'
    last_name 'Stark'
    email 'tonystark@example.com'
    phone '+380310000000'
    gender true
    birth_date DateTime.new(1990, 1, 1)
    factory :admin do
      admin true
    end
  end
end
