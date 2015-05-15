class AddServerTokenToAuthorization < ActiveRecord::Migration
  def change
    add_column :authorizations, :server_token, :string
  end
end
