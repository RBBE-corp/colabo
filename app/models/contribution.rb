class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :project
  enum status: [:pending, :accepted, :denied]
end
