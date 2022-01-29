class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :project_name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 2000 }
  validates :people_required, presence: true, inclusion: { in: 1..100 }
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :reward_earned, presence: true
  validates :points_earned, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true

  has_many :contributions
  def self.contributions_count
    left_joins(:contributions)
    .group(:id)
    .order('COUNT(contributions.id) DESC')
    .limit(10)
  end
end
