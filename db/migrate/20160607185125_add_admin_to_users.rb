class AddAdminToUsers < ActiveRecord::Migration
  def change
    # default: false not necessary, but cleaner (admin is nil by default without)
    add_column :users, :admin, :boolean, default: false
  end
end
