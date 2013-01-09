class HomeController < ApplicationController
  def home
    @boxes = Box.find(:all)
  end
end
