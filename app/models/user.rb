class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :school_year, presence: true, numericality: { in: 1..7 }

end
