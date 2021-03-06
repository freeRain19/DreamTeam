class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  #before_action :set_project, only: [:new, :create]
  load_and_authorize_resource
  # GET /tasks
  # GET /tasks.json
  def index

    if params[:user_id].present?
      @user=User.find_by_id(params[:user_id])
      @tasks=@user.tasks
      @tasks=Task.get_complete(params[:commit], @tasks)
      render
    end
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
      @tasks=@project.tasks
      @tasks=Task.get_complete(params[:commit], @tasks)
    else
      @tasks=Task.all
      @tasks=Task.get_complete(params[:commit], @tasks)
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end


  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.project_id=@project.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_url(@task.project_id), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_url(@task.project_id), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@task.project_id), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:title, :status, :start_date, :due_date, :estimation, :project_id, :user_id)
  end

end
