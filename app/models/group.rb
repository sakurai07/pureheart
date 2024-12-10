class Group < ApplicationRecord
  has_many :groupmembers , dependent: :destroy
  has_many :groupmessages , dependent: :destroy
  belongs_to :user
end
