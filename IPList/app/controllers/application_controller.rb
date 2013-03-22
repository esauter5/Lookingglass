class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :verified_request?

  def verified_request?
    if request.content_type == "application/json"
      true
    else
      super()
    end
end
end
