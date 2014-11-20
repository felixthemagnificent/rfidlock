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
      uname = Worker.where(card: username)
      if not uname.nil? || uname.empty?
        ss[:name] = uname.first.username
      else
        ss[:name] = 'Unknown'
      end

      ulocation =  Reader.where(serial: checkin.readerSerial)
      if not ulocation.empty? || ulocation.nil?
        ss[:location] = ulocation.first.desc
      else
        ss[:location] = 'Unregistered reader'
      end
      ss[:time] = checkin.created_at
      ss[:style] = 'danger'
      perm = nil
      unless ulocation.empty? || ulocation.nil?

        unless uname.empty? || uname.nil?
        perm = Permission.where(reader_id: ulocation.first.id, user_id: uname.first.id)
        unless perm.nil? || perm.empty?
          ss[:style] = 'success'
        else if not uname.empty?
          ss[:style] = 'warning'
          end
        end
        end

      end

      if ulocation.first.customer == current_user.id
        @resp.push(ss)
      end


    }

    respond_with(@resp)
  end

  def show
    respond_with(@check_in)
  end


  def auth
    card_serial = params[:card]
    reader_serial = params[:reader];
    CheckIn.create(:card_user => card_serial, :readerSerial => reader_serial)

    user_id = Worker.where(:card => card_serial)
    reader_id = Reader.where(:serial => reader_serial)
    unless user_id.nil? or reader_id.nil?
      @perm = Permission.where(:user_id => user_id, :reader_id => reader_id)
      unless @perm.nil?
        render text: "YES"
      end
    end
    if user_id.nil? or reader_id.nil?
      render text: "NO"
    end
    #respond_with(@check_in)
    #@check_in.delete
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
