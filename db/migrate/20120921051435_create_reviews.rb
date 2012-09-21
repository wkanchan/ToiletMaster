class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.integer :toilet_id
      t.string :detail
      t.integer :clean

      t.timestamps
    end
  end
end
