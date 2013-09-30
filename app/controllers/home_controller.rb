class HomeController < ApplicationController
  def index
    @profile = Profile.find_with_reputation(:votes, :all, order: "votes desc")
  end
end
