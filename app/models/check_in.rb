class CheckIn < ActiveRecord::Base
  belongs_to :worker
  belongs_to :reader
  belongs_to :user
end
