class ContributionsController < ApplicationController
  before_action :find_project, only: [ :create]
  # after_action :verify_authorized, except: [:new, :create, :destroy]

  def new
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new
    @contribution.user = current_user # user does not own this project, user is logged in
    @contribution.project = @project
    @contribution.status = :pending
    @contribution.start_date = DateTime.current
    authorize @contribution # just before saving
    @contribution.save
    redirect_to project_path(@project)
  end

  def destroy
    @contribution = Contribution.find(params[:id])
    @project_id = @contribution.project
    authorize @contribution
    @contribution.destroy
    redirect_to project_path(@project_id) # don't need project_path
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end
end
