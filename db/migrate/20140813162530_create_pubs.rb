class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :title
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
