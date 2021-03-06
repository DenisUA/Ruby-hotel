class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook]

  has_and_belongs_to_many :apartments
  has_many :orders
  has_many :help_requests

  validates :first_name, :last_name, presence: true,
                                     format: { with: /\A[A-Z].*\z/, message: 'Please, start from upper case' }
  validates :email, uniqueness: true,
                    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
                    presence: { message: 'Please, fill the field with correct email' }
  validates :phone, uniqueness: true

  devise :database_authenticatable, :registerable, :recoverable

  def full_name
    "#{last_name} #{first_name}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider =   auth.provider
      user.uid =        auth.uid
      user.first_name = auth.extra.raw_info.first_name
      user.last_name =  auth.extra.raw_info.last_name
      user.email =      auth.extra.raw_info.email
      user.gender =     auth.extra.raw_info.gender == 'male' ? 1 : 0
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
