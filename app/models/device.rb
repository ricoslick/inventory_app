class Device < ApplicationRecord
  belongs_to :user
  validates(:user_id, presence: true)
  validates(:serial, presence: true)
end
