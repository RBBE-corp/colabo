class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @projects = Project.all
    # If current user has projects they are a sponsor
    @sponsor = current_user.projects.count > 1
  end
end
