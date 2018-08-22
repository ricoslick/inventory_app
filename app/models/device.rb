class Device < ApplicationRecord
  belongs_to :user
  validates(:user_id, presence: true)
  validates(:category, presence: true)
  validates(:make, presence: true)
  validates(:model, presence: true)
  validates(:serial, presence: true, uniqueness: { case_sensitive: false })
end
