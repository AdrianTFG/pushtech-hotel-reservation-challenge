class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include Language

  skip_before_action :verify_authenticity_token
end
