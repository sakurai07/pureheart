class User < ApplicationRecord

  validates :user_name, presence: true
  validates :user_name, uniqueness: true

  validates :password, presence: true, on: :create
  validates :password, length: {minimum: 8}, on: :create
  has_secure_password

  validates :name, presence: true

  validates :grade, presence: true

  validates :klass, presence: true

  # validates :icon, presence: true

  validates :profile, presence: true

  validates :hobby_1, presence: true

  #関連付け
  has_many :follows, dependent: :destroy
  has_many :followeds,class_name:"Follow", foreign_key: "followed_user_id"
  has_many :blocks, dependent: :destroy
  has_many :blockeds,class_name:"Block", foreign_key: "blocked_user_id"
  has_many :groups, dependent: :destroy
  has_many :groupmembers, dependent: :destroy
  has_many :groupmessages,dependent: :destroy

  enum grade: {"1年": 1,"2年": 2,"3年": 3}
  enum klass: {"1組": 1,"2組": 2,"3組": 3,"4組": 4}


end
