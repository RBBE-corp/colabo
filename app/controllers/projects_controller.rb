class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_project, only: [:show, :edit, :update]

  def index
    # @projects = Project.all
    @projects = policy_scope(Project)
  end

  def show
    @markers = @project.geocode.map
    {
      lat: @project.latitude,
      lng: @project.longitude
    }
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
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
    params.require(:project).permit(:project_name, :description, :people_required, :location, :start_date, :end_date, :reward_earned, :points_earned, :photo)
  end

  def find_project
    @project = Project.find(params[:id])
    authorize @project
  end
end
