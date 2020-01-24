class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness:true

  has_many :pins, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end
