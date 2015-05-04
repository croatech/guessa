class Game < ActiveRecord::Base
  has_one :user

  def right_answer
    increment!(:score)
  end
end