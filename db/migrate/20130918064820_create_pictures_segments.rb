class CreatePicturesSegments < ActiveRecord::Migration
  create_table :pictures_segments, :id => false do |t|
    t.references :picture
    t.references :segment
  end
end
