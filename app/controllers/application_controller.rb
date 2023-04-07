class ApplicationController < ActionController::Base
  # フラッシュの種類
  add_flash_types :primary, :success, :warning, :danger
end
