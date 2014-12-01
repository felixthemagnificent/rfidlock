class CheckInsController < ApplicationController
  before_action :set_check_in, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:index,:show]
  respond_to :html, :json

  def index
    check_ins = CheckIn.all
    @resp = Array.new

    check_ins.each { |checkin|
      ss = Hash.new
      username = checkin.card_user
      uname = Worker.where(card: username).first
      unless uname.nil?
        ss[:name] = uname.username
      else
        ss[:name] = 'Unknown'
      end

      ulocation =  Reader.where(serial: checkin.readerSerial).first
      if not ulocation.nil?
        ss[:location] = ulocation.desc
      else
        ss[:location] = 'Unregistered reader'
      end
      ss[:time] = checkin.created_at
      ss[:style] = 'danger'
      perm = nil
      unless ulocation.nil?
        unless uname.nil?
          perm = Permission.where(reader_id: ulocation.id, worker_id: uname.id).first
          unless perm.nil?
              ss[:style] = 'success'
          else
            unless uname.nil?
                ss[:style] = 'warning'
            end
          end
        end
      end

      if ulocation.user == current_user
        @resp.push(ss)
      end


    }
    @resp.reverse!
    respond_with(@resp)
  end

  def show
    respond_with(@check_in)
  end


  def auth
    card_serial = params[:card]
    reader_serial = params[:reader]
    CheckIn.create(:card_user => card_serial, :readerSerial => reader_serial)

    worker = Worker.where(:card => card_serial).first
    reader = Reader.where(:serial => reader_serial).first
    unless worker.nil? or reader.nil?
      @perm = Permission.where(:worker_id => worker.id, :reader_id => reader.id).first
      unless @perm.nil?
        render text: "YES"
      end
    end
    render text: "NO"
  end

  def edit
  end




  private
    def set_check_in
      @check_in = CheckIn.find(params[:id])
    end

    def check_in_params
      params.require(:check_in).permit(:card_user, :readerSerial)
    end
end
