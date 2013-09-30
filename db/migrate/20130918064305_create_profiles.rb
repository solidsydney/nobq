class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :age
      t.string :country_of_application
      t.string :state_of_origin
      t.string :city
      t.string :residential_address
      t.string :occupation
      t.string :office_address
      t.string :marital_status
      t.string :phone_number
      t.string :identification_number
      t.string :id_card_provider
      t.string :hobbies
      t.text :bio

      t.timestamps
    end
  end
end
