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
end
