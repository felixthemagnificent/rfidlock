class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    @permissions = Array.new
    Permission.all.each { |perm|
      s = Hash.new
      uid = perm.worker_id
      rid = perm.reader_id
      s[:user] = Worker.find(uid)
      s[:location] = Reader.find(rid)
      s[:permission] = perm
      if perm.user == current_user
        @permissions.push(s)
      end
    }

    respond_with(@permissions)
  end

  def show
    @workers = Worker.all.where(:user => current_user)
    @readers = Reader.all.where(:user => current_user)
    respond_with(@permission,@workers,@readers)
  end

  def new
    worker = Worker.all
    @workers = Array.new
    worker.each { |wrk|
      tmp = Array.new
      tmp.push(wrk.username)
      tmp.push(wrk.id)
      if wrk.user == current_user
        @workers.push(tmp)
      end
    }

    reader = Reader.all
    @readers = Array.new
    reader.each { |rdr|
      tmp = Array.new
      tmp.push(rdr.desc)
      tmp.push(rdr.id)
      if rdr.user == current_user
        @readers.push(tmp)
      end
    }
    @permission = Permission.new
    @permission.user = current_user
    respond_with(@permission, @workers, @readers)
  end

  def edit
    worker = Worker.all
    @workers = Array.new
    worker.each { |wrk|
      tmp = Array.new
      tmp.push(wrk.username)
      tmp.push(wrk.id)
      if wrk.user == current_user
        @workers.push(tmp)
      end
    }

    reader = Reader.all
    @readers = Array.new
    reader.each { |rdr|
      tmp = Array.new
      tmp.push(rdr.desc)
      tmp.push(rdr.id)
      if rdr.user == current_user
        @readers.push(tmp)
      end
    }
    respond_with(@workers, @readers)
  end

  def create
    @permission = Permission.new(permission_params)
    @permission.user = current_user
    @permission.save
    respond_with(@permission)
  end

  def update
    @permission.user = current_user
    @permission.update(permission_params)
    respond_with(@permission)
  end

  def destroy
    @permission.destroy
    respond_with(@permission)
  end

  private
    def set_permission
      @permission = Permission.find(params[:id])
    end

    def permission_params
      params.require(:permission).permit(:worker_id, :reader_id)
    end
end
