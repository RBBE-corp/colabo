class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @projects = Project.contributions_count
    projects = Project.all
    @markers = projects.geocoded.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude
      }
    end
  end

  def about;  end
end
