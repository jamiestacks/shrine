class User < ApplicationRecord
  has_many :stories
  has_many :messages
  has_many :shrine_users
  has_many :shrines, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    role == "admin"
  end
end
