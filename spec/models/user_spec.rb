require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(first_name: 'Yaroslav',
                     last_name: 'Liakh',
                     email: 'liakhyaroslav@gmail.com',
                     phone: '+380506456220',
                     gender: 'Man',
                     date_of_birth: '7/1/1990',
                     admin: false)
  it { user.valid? }

  it 'returns full name' do
    expect(user.full_name).to eq 'Liakh Yaroslav'
  end
end
