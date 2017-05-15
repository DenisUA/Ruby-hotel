class User < ApplicationRecord
  validates :first_name, :last_name, presence: { message: 'Please, fill the field!' },
                                     format: { with: /\A[A-Z].*\z/, message: 'Please, start from upper case' }
  validates :email, uniqueness: true
  validates :phone, uniqueness: true

  def full_name
    "#{last_name} #{first_name}"
  end
end
