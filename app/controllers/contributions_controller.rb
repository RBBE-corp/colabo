class ContributionsController < ApplicationController
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
