# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_before_action :authentication_required, only: [:home]

  def home
    redirect_to user_path(current_user) if logged_in?
  end
end
