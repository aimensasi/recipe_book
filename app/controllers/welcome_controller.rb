class WelcomeController < ApplicationController

    # before_action :new_user

  layout "welcome_layout"

  def index
    if current_user

      redirect_to current_user
    end

  end

end
