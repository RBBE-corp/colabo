class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :components]

  def home
    @projects = Project.contributions_count
  end

  def components; end
end
