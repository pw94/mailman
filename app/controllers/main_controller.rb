class MainController < ApplicationController
  include MainHelper
  def index
    @stats = stats
  end
end
