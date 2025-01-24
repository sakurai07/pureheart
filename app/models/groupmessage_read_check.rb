class GroupmessageReadCheck < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :groupmessage
end
