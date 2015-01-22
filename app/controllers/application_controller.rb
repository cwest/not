class ApplicationController < ActionController::Base
  include Pundit
  include DeviseHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def id
    @_id ||= params[:id]
  end
end
