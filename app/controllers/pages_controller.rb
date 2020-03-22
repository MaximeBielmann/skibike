class PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:admin]
  def home
  end

  def admin
  end
  
  def shop
  end
  
  def booking
  end
  
  def contact
  end
end
