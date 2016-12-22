module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    session[:user_id]
  end

  def new_user
    if logged_in?
      redirect_to edit_user_path(current_user.id)
    end
  end

  def current_user
    User.find_by_id(session[:user_id])
  end



  def require_login
    unless current_user
      redirect_to sign_in_path
    end
  end

  def store_prev_page
    session[:pre_page] = request.env["HTTP_REFERER"]
  end


  def redirect_to_user_profile user
    # byebug
    if user.school
      redirect_to edit_school_path user.school
    else
      redirect_to edit_individual_path user.individual
    end
  end

  def redirect_back_or(default = root_url)

    if session[:pre_page].present? and session[:pre_page] != request.env["REQUEST_URI"]
      redirect_to session[:pre_page]
    else
      redirect_to default
    end
    # byebug
  end

  def log_out
     session[:user_id] = nil
     session[:pre_page] = nil

  end
end
