class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def logged_in?(group)
    !!session["group_#{group.id}_user_id"]
  end

  def current_user(group)
    if logged_in?(group)
      return User.find(session["group_#{group.id}_user_id"])
    end
  end
end
