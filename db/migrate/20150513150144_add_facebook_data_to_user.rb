class AddFacebookDataToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_data, :string
  end
end
