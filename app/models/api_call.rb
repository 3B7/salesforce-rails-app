class ApiCall < ActiveRecord::Base
  attr_accessible :max_calls, :remaining_calls, :used_calls
  
  validates_presence_of :max_calls
  validates_presence_of :remaining_calls

end