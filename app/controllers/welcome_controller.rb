class WelcomeController < ApplicationController

    # before_action :new_user

  layout "welcome_layout"

  def index
    if current_user
      redirect_to_user_profile user
    else

    end

  end

end
