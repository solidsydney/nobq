class CreateMessages< ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :picture_id
      t.text :body

      t.timestamps
    end
  end
end
