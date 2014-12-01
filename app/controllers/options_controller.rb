class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @options = Option.all
    respond_with(@options)
  end

  def show
    respond_with(@option)
  end

  def new
    @option = Option.new
    respond_with(@option)
  end

  def edit
  end

  def create
    @option = Option.new(option_params)
    flash[:notice] = 'Option was successfully created.' if @option.save
    respond_with(@option)
  end

  def update
    flash[:notice] = 'Option was successfully updated.' if @option.update(option_params)
    respond_with(@option)
  end

  def destroy
    @option.destroy
    respond_with(@option)
  end

  private
    def set_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:card, :reader_id)
    end
end
