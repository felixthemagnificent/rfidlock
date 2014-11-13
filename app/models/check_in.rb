class CheckIn < ActiveRecord::Base
  belongs_to :worker
  belongs_to :reader
end
