class WelcomeController < ApplicationController

    # before_action :new_user

  layout "welcome_layout"

  def index
    if current_user

      current_user
    end

  end

end
