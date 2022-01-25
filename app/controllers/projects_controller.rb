class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project), notice: "Project created."
   else
      render :new     
   end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to project_path, notice: "Project updated."
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :description, :people_required, :location, :start_date, :end_date, :reward_earned, :points_earned)
  end

  def find_project
    Project.find(params[:id]);
  end
end