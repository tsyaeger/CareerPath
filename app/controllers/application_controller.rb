# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_action :authentication_required
  protect_from_forgery with: :exception

  protected

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    current_user ||= User.find(session[:user_id])
  end

  def authentication_required
    redirect_to root_path unless logged_in?
  end
end
