# frozen_string_literal: true

class AddPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string, after: 'eamil'
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
