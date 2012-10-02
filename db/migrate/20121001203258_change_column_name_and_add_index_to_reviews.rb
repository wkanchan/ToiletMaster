class ChangeColumnNameAndAddIndexToReviews < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.remove  :reviewer, :detail
      t.integer :user_id
      t.string  :content
    end

    add_index :reviews, [:user_id, :created_at]
  end
end
