class AddIndexToUsersEmail < ActiveRecord::Migration
  # email uniqueness not predefined in migrations, so code implemented here
  def change
    # add index on column of users table
    add_index :users, :email, unique: true
  end
end
