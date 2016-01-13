class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :move]
  before_action :get_all_list, only: [:index, :new, :move, :edit]
  # GET /tasks
  # GET /tasks.json
  def index
    
  end

  # GET /tasks/new
  def new
    @list = List.find_by(id:params[:list_id])
    @task = @list.tasks.build
  end

  # GET /tasks/1/edit
  def edit

  end

  # POST /tasks
  # POST /tasks.json
  def create
    list = List.find_by(id:get_list_id)
    list.tasks.build(task_params)
    
    respond_to do |format|
      if list.save
        format.html { redirect_to root_url, notice: 'Task was successfully created.' }
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
        format.html { redirect_to  edit_task_path(@task) }
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
      format.html { redirect_to  edit_list_path(@task.list)}
      format.json { head :no_content }
    end
  end

  def move

  end

  def move_task
    para = params.require(:task)
    
    @task = Task.find_by(id:para[:id])
    
    @task.update_attributes!(para.permit(:list_id))
    redirect_to move_task_path(para[:id])
  end

  def show_task_not_active
    @tasks = Task.unscoped.where(hidden: false)
  end

  private
    def get_all_list
       @lists = List.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find_by(id:params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :hidden)
    end
    def get_list_id
      params.require(:task)[:list_id]
    end
end
