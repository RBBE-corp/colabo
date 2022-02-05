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

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many :contributions

  validate :start_date_cannot_be_after_end_date,
     :start_date_cannot_be_before_today

  def start_date_cannot_be_after_end_date
    if start_date > end_date
      errors.add(:start_date, "can't be after end date")
    end
  end

  def start_date_cannot_be_before_today
    if start_date < DateTime.now
      errors.add(:start_date, "can't be before today")
    end
  end


  def self.contributions_count
    left_joins(:contributions)
    .group(:id)
    .order('COUNT(contributions.id) DESC')
    .limit(10)
  end

  def find_users
    users_array = []
    contributions.each do | contribution |
      users_array << contribution.user
    end
    users_array
  end

  def find_contribution(contributor)
    Contribution.all.where("project_id = ? AND user_id = ?", id, contributor.id).first # SQL Array
  end

  #pg search
  include PgSearch::Model
  pg_search_scope :search_by_project_and_location,
    against: [ :project_name, :description, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


  def ends_in_future?
    end_date > DateTime.now
  end

  def accepted
    accepted = contributions.select { |contribution| contribution.status == "accepted"}
  end
end
