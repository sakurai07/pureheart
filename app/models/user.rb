class User < ApplicationRecord

  validates :user_name, presence: true
  validates :user_name, uniqueness: true

  validates :password, presence: true
  validates :password, length: {minimum: 8}
  has_secure_password

  validates :name, presence: true

  validates :grade, presence: true

  validates :klass, presence: true

  # validates :icon, presence: true

  validates :profile, presence: true

  validates :hobby_1, presence: true

end
