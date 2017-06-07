class Contact < ApplicationRecord
  validates :name, :email, :body, presence: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :body, length: { maximum: 400 }
end
