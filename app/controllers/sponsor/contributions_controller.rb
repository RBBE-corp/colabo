class Sponsor::ContributionsController < ApplicationController
  # before_action :find_contributions, only: [:index, :show, :create]

  def index
    @contributions = Contribution.all
    # authorize @contributions
    @contributions = policy_scope [:sponsor, Contribution]
    # authorize [:sponsor, @contribution]
  end

  def show
    # @contribution made available at the bottom
    @contribution = Contribution.find(params[:id])
  end

  def new
    @contribution = Contribution.new
    # authorize @contribution
  end

  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.user = contribution_user
    # authorize @contribution
    if @contribution.save
      redirect_to contribution_path(@contribution)
    else
      render :new
    end
  end

  def edit
     # @contribution made available at the bottom
  end

  def update
     # @contribution made available at the bottom
     @contribution.update(contribution_params)
     # redirect to show page
     redirect_to contribution_path
  end

  def destroy
     #@contribution made available at the bottom
     @contribution.destroy
     # redirect to index page
     redirect_to contributions_path
  end

  private

  def contributions_params
    params.require(:contribution).permit(:status)
  end

  # def find_contributions
  #   @contribution = Contribution.find(params[:project_id, :user_id])
  #   authorize @contribution
  # end
end
