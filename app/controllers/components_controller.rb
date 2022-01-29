class ComponentsController < ApplicationController
  after_action :verify_authorized, except: [:show]

  def show
    @user_name = current_user.first_name
  end

end
