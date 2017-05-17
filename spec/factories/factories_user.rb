FactoryGirl.define do
  factory :user do
    first_name 'Tony'
    last_name 'Stark'
    email 'tonystark@example.com'
    phone '+380310000000'
    gender true
    date_of_birth DateTime.new(1990, 1, 1)
    admin false
  end
end