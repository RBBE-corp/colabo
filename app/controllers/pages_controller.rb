class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @projects = Project.contributions_count
    if current_user&.projects&.count > 0
      @sponsor = current_user
    end
  end
end
