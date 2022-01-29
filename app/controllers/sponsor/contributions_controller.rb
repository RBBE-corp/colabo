class Sponsor::ContributionsController < ApplicationController
  before_action :find_contribution, only: [:show, :create, :edit, :update]

  def index
    @contributions = Contribution.all
    @contributions = policy_scope [:sponsor, Contribution]
    # authorize [:sponsor, @contribution]
  end

  def show
  end

  def update
    case @contribution.update(contribution_params)
    when :accepted
      @contribution.status = :accepted
      redirect_to contribution_path, notice: "Contribution accepted."
    when :denied
      @contribution.status = :denied
      redirect_to contribution_path, notice: "Contribution denied."
    end
  end

  private

  def contribution_params
    params.require(:contribution).permit(:status)
  end

  def find_contribution
    @contribution = Contribution.find(params[:id])
  end
end
