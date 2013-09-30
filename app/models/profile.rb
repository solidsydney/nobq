class Profile < ActiveRecord::Base
  attr_accessible :age, :bio, :city, :country_of_application, :first_name, :hobbies, :id_card_provider, :identification_number, :last_name, :marital_status, :middle_name, :occupation, :office_address, :phone_number, :residential_address, :state_of_origin, :user_id, :photo
  belongs_to :user
  has_many :pictures
  has_many :replies, :through => :pictures, :source => :messages

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "50x50#" }, :default_url => "/assets/missing.png"


  has_reputation :votes, source: {reputation: :votes, of: :pictures }, aggregated_by: :sum




end
