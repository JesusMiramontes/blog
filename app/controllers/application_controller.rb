class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_category

  private
  def set_category
    @categories = Category.all
  end
end
