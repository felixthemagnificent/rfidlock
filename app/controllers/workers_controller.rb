class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @workers = Worker.all.where(:user => current_user)
    respond_with(@workers)
  end

  def show
      respond_with(@worker)
  end

  def new
    @worker = Worker.new
    @worker.user = current_user
    respond_with(@worker)
  end

  def edit
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.user = current_user
    flash[:notice] = 'Worker was successfully created.' if @worker.save
    respond_with(@worker)
  end

  def update
    @worker.user = current_user
    flash[:notice] = 'Worker was successfully updated.' if @worker.update(worker_params)
    respond_with(@worker)
  end

  def destroy
    @worker.destroy
    respond_with(@worker)
  end

  private
    def set_worker
      @worker = Worker.find(params[:id])
      unless @worker.user == current_user
        @worker = nil
      end
    end

    def worker_params
      params.require(:worker).permit(:card, :username)
    end
end
