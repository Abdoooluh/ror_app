class ApplicationController < ActionController::Base
  before_action :authenticate_user_or_vendor!
  allow_browser versions: :modern

  private

  def authenticate_user_or_vendor!
    unless user_signed_in?
        redirect_to new_user_session_path
    end
  end
end
