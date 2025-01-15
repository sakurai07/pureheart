class Group < ApplicationRecord
  has_many :groupmembers , dependent: :destroy
  has_many :groupmessages , dependent: :destroy
  belongs_to :user
  validates :group_name, presence: true
  validates :comment, presence: true
  validates :hobby_1, presence: true

end
