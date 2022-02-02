class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @projects = Project.contributions_count
  end

  def about;  end
end
