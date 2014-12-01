class Permission < ActiveRecord::Base
  has_one :reader
  has_one :worker
  belongs_to :user
end
