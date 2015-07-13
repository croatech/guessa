class Order < ActiveRecord::Base
  has_many :requests
end
