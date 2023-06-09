class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :foods
  has_many :recipes

  validates :name, presence: true, length: { minimum: 3 }
  validates :password, presence: true
end
