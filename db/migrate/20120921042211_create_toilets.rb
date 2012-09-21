class CreateToilets < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
