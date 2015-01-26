class ApplicationController < ActionController::Base
  include Pundit
  include DeviseHelper

  ensure_security_headers
  protect_from_forgery with: :exception

  private

  def id
    @_id ||= params[:id]
  end
end
