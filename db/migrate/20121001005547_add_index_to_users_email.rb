class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    # add "index" the email column of the users table
    # this enforce uniqueness at DB level because DB will store indices for emails
    # and will look for it to see if that email is already existed
    add_index :users, :email, unique: true
  end
end
