class User < ApplicationRecord
  validates :first_name, :last_name, :org_name, :total_points, presence: true
  has_many :projects
  has_many :contributions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  before_validation :def_total_points, on: :create

  def def_total_points
    self.total_points = 0
  end

  def sponsor?
    projects.count > 0
  end

  def user_total_points
    sum = 0
    contributions.each do |contribution|
      if contribution.status == 'accepted' && contribution.project.end_date < DateTime.now
        sum += contribution.project.points_earned
      end
    end
    return sum
  end

end
