class Message < ActiveRecord::Base
  attr_accessible :body, :picture_id, :parent_id
 has_ancestry

  belongs_to :picture
end
