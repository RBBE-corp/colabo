class UsersController < ApplicationController
  def show
    # @projects = Project.all
    # authorize @projects
    @user_id = current_user.id
    @user_projects = Project.all.where user_id: @user_id
    authorize @user_projects

    @user_contributions = Contribution.all.where user_id: @user_id
    # authorize @user_contributions
  end
end
