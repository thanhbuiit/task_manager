class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :new_list,  only: [:new, :index, :add_list_tasks_logs]
  before_action :list_nested_params, only:[:add_list]

  # GET /lists
  # GET /lists.json
  def index
    
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to root_url}
        #format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    p "++++++++++++++++++++++++++++++====++++++++++++="
    p params
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to root_url}
        #format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    redirect_to root_url
  end

  def show_list_not_active
    @lists = List.all.unscoped.where(hidden:false)
  end

  def add_list_tasks_logs
    (0..2).each do |x|
      t = @list.tasks.build
      t.logs.build(action_name:"Create", date_update: Time.now)
    end
  end

  def add_list
    list = List.new(list_nested_params)
    list.save
    redirect_to root_url
  end

  private
    def new_list
      @list = List.new
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.unscoped.find_by(id:params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :hidden)
    end

    def list_nested_params
      params.require(:list).permit(:name, :hidden ,{tasks_attributes:[:name, :description, :hidden, logs_attributes:[:action_name, :date_update]]})
    end
end
