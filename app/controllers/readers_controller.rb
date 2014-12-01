class ReadersController < ApplicationController
  before_action :set_reader, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    @readers = Reader.all.where(:user => current_user)
    respond_with(@readers)
  end

  def show
    respond_with(@reader)
  end

  def new
    @reader = Reader.new
    @reader.user = current_user
    respond_with(@reader)
  end

  def edit
  end

  def create
    @reader = Reader.new(reader_params)
    @reader.user = current_user
    @reader.save
    respond_with(@reader)
  end

  def update
    @reader.user = current_user
    @reader.update(reader_params)
    respond_with(@reader)
  end

  def destroy
    @reader.destroy
    respond_with(@reader)
  end

  private
    def set_reader
      @reader = Reader.find(params[:id])
      @reader.user = current_user
    end

    def reader_params
      params.require(:reader).permit(:serial, :desc)
    end
end
