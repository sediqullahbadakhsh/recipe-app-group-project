class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :food, dependent: :delete_all
  has_many :recipe, dependent: :delete_all

  validates :name, presence: true
  validates :password, presence: true
end
