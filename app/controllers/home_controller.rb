class HomeController < ApplicationController
  def index
    @users = User.all
    @tasks = Task.all
    plex = Plex.new
    @test_array = plex.questions
    @plex_data = plex.questions
  end
end
