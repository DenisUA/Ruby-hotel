class User < ApplicationRecord
  has_many :orders
  has_many :help_requests

  validates :first_name, :last_name, presence: true,
                                     format: { with: /\A[A-Z].*\z/, message: 'Please, start from upper case' }
  validates :email, uniqueness: true,
                    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
                    presence: { message: 'Please, fill the field with correct email' }
  validates :phone, uniqueness: true,
                    presence: { message: 'Please, fill the field with correct phone number' }

  devise :database_authenticatable, :registerable, :recoverable

  def full_name
    "#{last_name} #{first_name}"
  end
end
