class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :post_study_methods, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :school_year, presence: true, numericality: { in: 1..7 }

  def self.guest
    find_or_create_by!(name: "ゲストユーザー" , email: "guest@example.com", school_year: 7) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.email = "guest@example.com"
    end
  end

end
