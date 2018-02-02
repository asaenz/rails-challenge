class Member < ApplicationRecord
  validates :name, presence: true
  validates :website, presence: true
end