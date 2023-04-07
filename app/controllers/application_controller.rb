class ApplicationController < ActionController::Base
  include Pagy::Backend
  # フラッシュの種類
  add_flash_types :primary, :success, :warning, :danger
end
