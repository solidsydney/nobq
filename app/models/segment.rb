class Segment < ActiveRecord::Base
  attr_accessible :about, :name

  has_and_belongs_to_many :pictures

end
