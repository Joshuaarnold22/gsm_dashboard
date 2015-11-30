class TasksController < ApplicationController
  def index
    #@tasks = Task.all

    @tasks = Task.all.select{|t| t.time_left > 0}
    # Task.where("created < ?", Time.now - )
    @users = User.all
    # authorize @tasks
  end

  def show
    @task = Task.find(params[:id])
    # @user = @task.user.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @task = Task.new
    authorize @task
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(item_params)
      flash[:notice] = "Task was updated."

      respond_to do |format|
        format.html{redirect_to tasks_path}
        format.js
      end
    else
      flash[:error] = "There was an error saving the task.  Please try again."
      render :edit
    end
  end

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.build(item_params)
    if @task.save
    authorize @task
      flash[:notice] = "Task was saved."
      redirect_to user_tasks_path
    else
      flash[:error] = "There was an error saving the task.  Please try again."
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])

    authorize @task
    if @task.destroy
      flash[:notice] = "\"#{@task.name}\" was deleted."
      redirect_to tasks_path
    else
      flash[:error] = "There was an error."
      render :show
    end
  end

  private

  def item_params
    params.require(:task).permit(:name, :description, :completed, :user_id, :days_to_complete)
  end
end
