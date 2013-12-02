class User < ActiveRecord::Base
  attr_accessible :admin, :name
  has_many :comments
end
