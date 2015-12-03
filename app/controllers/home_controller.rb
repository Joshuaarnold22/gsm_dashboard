class HomeController < ApplicationController
  def index
    @users = User.all
    @tasks = Task.all
    @plex = Plex.new
    @plex_data = @plex.questions
    # @plex_data = plex.questions
  end
end
