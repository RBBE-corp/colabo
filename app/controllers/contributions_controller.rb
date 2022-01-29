class ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new
    @contribution.user = current_user # user does not own this project, user is logged in
    @contribution.project = Project.find(params[:id])
    @contribution.status = :pending
    @contribution.save
    redirect_to contributions_path
  end

  def edit
    @contribution = Contribution.find(params[:id])
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
end
