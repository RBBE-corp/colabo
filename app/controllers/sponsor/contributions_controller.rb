class Sponsor::ContributionsController < ApplicationController
  before_action :find_contribution, only: [:show, :create, :edit, :update]

  def index
    @contributions = Contribution.all
    @contributions = policy_scope [:sponsor, Contribution]
    # authorize [:sponsor, @contribution]
  end

  def show
    # @contribution made available with private method
  end

  # As of now sponsor should not be able to create contributions
  # def new
  #   @contribution = Contribution.new
  #   # authorize @contribution
  # end

  # def create
  #   @contribution = Contribution.new(contribution_params)
  #   @contribution.user = contribution_user
  #   # authorize @contribution
  #   if @contribution.save
  #     redirect_to contribution_path(@contribution)
  #   else
  #     render :new
  #   end
  # end

  def edit
    # @contribution made available with private method
    # sponsor should be able to change :status enum
  end

  def update
     # @contribution made available with private method
     @contribution.update(contribution_params)
     # redirect to show page
     redirect_to contribution_path
  end

  private

  def contributions_params
    params.require(:contribution).permit(:status)
  end

  def find_contribution
    @contribution = Contribution.find(params[:id])
  end
end
