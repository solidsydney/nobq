class Picture < ActiveRecord::Base
  attr_accessible :profile_id, :photo

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "50x50" }

  belongs_to :profile
  has_many :messages
  has_and_belongs_to_many :segments

  has_reputation :votes, source: :user, aggregated_by: :sum

  after_create :cast_first_vote

  private

  def cast_first_vote
    self.

    link_to "up", vote_profile_picture_path(picture, type: "up"), method: "post"
  end



end
