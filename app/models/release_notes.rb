class ReleaseNotes < ActiveRecord::Base

  validates_presence_of :version_number
  validates_presence_of :body

  belongs_to :created_by, :class_name => 'User'

  attr_accessible :version_number, :body, :created_by_id
end