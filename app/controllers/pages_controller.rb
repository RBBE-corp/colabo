class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @projects = Project.all
    if current_user.projects.count > 0
      @sponsor = current_user
    end
  end
end
