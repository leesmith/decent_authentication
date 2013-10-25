class HomeController < ApplicationController
  before_filter :require_authentication
end
