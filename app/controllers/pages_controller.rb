class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :products]

  def home
  end

  def events
  end


end
