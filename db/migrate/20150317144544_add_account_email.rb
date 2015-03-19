class AddAccountEmail < ActiveRecord::Migration
  def change
  	add_column :users, :account_email, :string
  end
end
