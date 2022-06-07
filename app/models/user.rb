class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :post_study_methods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :achieved_tasks, dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true
  validates :school_year, presence: true, numericality: { in: 1..7 }

  def self.guest
    find_or_create_by!(name: "ゲストユーザー" , email: "guest@example.com", school_year: 7) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.email = "guest@example.com"
    end
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
